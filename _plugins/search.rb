module Jekyll
  class SearchOptionsTag < Liquid::Tag
    def render(context)
      context.registers[:site].config['search_options'] ||= generate_search_options(context)
    end

    private

    def generate_search_options(context)
      site = context.registers[:site]
      Array(site.config['collections_to_search']).map do |collection, field|
        site.collections[collection].docs.map do |doc|
          %Q(<option value="#{doc.url}">#{doc.data['name']}</option>)
        end
      end.flatten.compact.join("\n")
    end
  end

  Liquid::Template.register_tag('search_options', Jekyll::SearchOptionsTag)
end
