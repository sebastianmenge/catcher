module Api
  class UrlExtractionsController < BaseController
    skip_before_filter :require_json_format
    require 'nokogiri'
    require 'open-uri'
    require 'uri'

    def show
      url = params[:id].split(" ").join(".")
      doc = Nokogiri::HTML(open(url))
      render json: { url_extraction: {
        title: title(doc),
        image: image(doc, url),
        description: desc(doc),
        url: url,
        favicon: favicon(url)
        }
      }
    end

    private

    def parse_prop(doc, prop)
      doc.xpath("#{prop}").map do |node|
        node.to_s
      end
    end

    def title(doc)
      fb_og = parse_prop(doc, "//meta[@property='og:title']/@content")
      tag = parse_prop(doc, '//title/text()')
      fb_og.first.present? ? fb_og.first : tag.first
    end

    def image(doc, url)
      fb_og = parse_prop(doc, "//meta[@property='og:image']/@content")
      tag = parse_prop(doc, '//img/@src')
      img_url = build_img_url(url, tag)
      fb_og.first.present? ? fb_og.first : img_url
    end

    def build_img_url(url, tag)
      rootUrl = URI::join(url, "/").to_s.gsub(/\/$/,'')
      img = tag.first.start_with?('https', 'http') ? tag.first : "#{rootUrl}#{tag.first}"
    end

    def desc(doc)
      fb_og = parse_prop(doc, "//meta[@property='og:description']/@content")
      tag = parse_prop(doc, '//p/text()')
      fb_og.first.present? ? fb_og.first : tag.first
    end

    def favicon(url)
      "http://www.google.com/s2/favicons?domain=#{url}"
    end
  end
end
