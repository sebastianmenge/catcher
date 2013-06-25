module Api
  class EntriesController < BaseController
    require 'nokogiri'
    require 'open-uri'

    def extract_url
      url = params[:url]
      doc = Nokogiri::HTML(open(url))
      data = if fb_attrs(doc).present?
        fb_attrs(doc)
      else
        substitute_attrs(doc)
      end
      render json: {properties: data}
    end

    def fb_attrs(doc, url)
      props = ['title', 'image', 'description', 'url' ]
      props = props.map do |prop|
        doc.xpath("//meta[@property='og:#{prop}']/@content").map do |node|
          node.to_s
        end
      end
      props.flatten if props.first.present?
    end

    def substitute_attrs(doc, url)
      props = ['//title/text()', '//img/@src', '//p/text()']
      props = props.map do |prop|
        doc.xpath("#{prop}").map do |node|
          node.to_s
        end
      end
      props << url
    end
  end
end
