require 'json'

module Jekyll
  module Search
    class SearchIndex
      attr_reader :site

      def initialize(site)
        @site = site
      end

      def documents
        site.collections.map do |name, collection|
          {
            name: name,
            docs: collection.docs.map do |document|
              { name: document.data['name'], url: document.url }
            end
          }
        end
      end

      def to_json
        JSON.pretty_generate(documents)
      end
    end

    class SearchPage < ::Jekyll::Page
      def initialize(site, base, dir, name)
        @site = site
        @base = base
        @dir = dir
        @name = name

        process(@name)

        self.data = {}
        self.content = SearchIndex.new(site).to_json

        Jekyll::Hooks.trigger :pages, :post_init, self
      end
    end

    class Generator < ::Jekyll::Generator
      def generate(site)
        site.pages << Jekyll::Search::SearchPage.new(site, site.source, '', 'search.json')
      end
    end
  end
end
