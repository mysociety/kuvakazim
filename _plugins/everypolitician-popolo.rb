require 'json'
require 'open-uri'

require 'active_support'
require 'active_support/core_ext/string'

module Jekyll
  class EverypoliticianPopolo < Generator
    def generate(site)
      popolo = JSON.parse(open(site.config['popolo_url']).read)
      popolo.keys.each do |collection_name|
        next unless popolo[collection_name].is_a?(Array)
        collection = Collection.new(site, collection_name)
        popolo[collection_name].each do |item|
          next unless item['id']
          path = File.join(site.config['source'], "_#{collection_name}", "#{item['id'].parameterize}.md")
          doc = Document.new(path, collection: collection, site: site)
          doc.merge_data!(item)
          doc.merge_data!(
            'title' => item['name'],
            'layout' => collection_name
          )
          collection.docs << doc
        end
        site.collections[collection_name] = collection
      end

      # Expose memberships as a "Jekyll datafile", because they don't have ids
      site.data['memberships'] = popolo['memberships']
    end
  end
end
