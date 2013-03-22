module Microdata
  class Document

    attr_reader :items, :doc

    def initialize(content, page_url=nil)
      @doc = Nokogiri::HTML(content)
      @page_url = page_url
      @items = extract_items
    end

    def extract_items
      itemscopes = @doc.search('//*[@itemscope and not(@itemprop)]')
      return nil unless itemscopes

      itemscopes.collect do |itemscope|
        Item.new(itemscope, @page_url)
      end
    end

  end
end