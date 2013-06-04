module Api
  class EntriesController < BaseController
    require 'nokogiri'
    require 'open-uri'
    def url_data
      url = params[:url]
      properties = parse_page(url)
      render json: {properties: properties}
    end

    def parse_page(url)
      doc = Nokogiri::HTML(open(url))
      properties = ['title', 'image', 'description', 'url' ]
      properties.each do |property|
        doc.xpath("//meta[@property='og:#{property}']/@content").each do |node|
          node
        end
      end
    end
  end
end
