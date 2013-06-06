module Api
  class EntriesController < BaseController
    require 'nokogiri'
    require 'open-uri'
    def url_data
      url = params[:url]
      result = parse_props(url)
      render json: {properties: result}
    end

    def parse_props(url)
      doc = Nokogiri::HTML(open(url))
      properties = ['title', 'image', 'description', 'url' ]
      fb_props = properties.map do |prop|
        doc.xpath("//meta[@property='og:#{prop}']/@content").map do |node|
          node.to_s
        end
      end
      if fb_props.first.present?
        fb_props
      else
        title = doc.xpath("//title/text()").map {|node| node.to_s}
        images = doc.xpath("//img/@src").map {|node| node.to_s}
        description = doc.xpath("//meta[@name='description']/@content").map {|node| node.to_s}
        [images.first, description ch  ch.first, title.first]
      end
    end
  end
end
