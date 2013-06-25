module Api
  class EntriesController < BaseController
    require 'nokogiri'
    require 'open-uri'

    def extract_props
      url = params[:url]
      doc = Nokogiri::HTML(open(url))
      render json: { properties: {
        title: title(doc).first,
        image: image(doc).first,
        description: desc(doc).first,
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
      fb = "//meta[@property='og:title']/@content"
      p = '//title/text()'
      if parse_prop(doc, fb).first.present?
        parse_prop(doc, fb)
      else
        parse_prop(doc, p)
      end
    end

    def image(doc)
      fb = "//meta[@property='og:image']/@content"
      p = '//img/@src'
      if parse_prop(doc, fb).first.present?
        parse_prop(doc, fb)
      else
        parse_prop(doc, p)
      end
    end

    def desc(doc)
      fb = "//meta[@property='og:description']/@content"
      p = '//p/text()'
      if parse_prop(doc, fb).first.present?
        parse_prop(doc, fb)
      else
        parse_prop(doc, p)
      end
    end

    def favicon(url)
      "http://www.google.com/s2/favicons?domain=#{url}"
    end
  end
end
