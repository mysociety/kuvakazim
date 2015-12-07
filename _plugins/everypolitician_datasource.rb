require 'open-uri/cached'

OpenURI::Cache.cache_path = '.cache'

# Configures the jekyll-everypolitician plugin to use the url in DATASOURCE
Jekyll::Hooks.register :site, :post_read do |site|
  site.config['everypolitician'] ||= {
    'sources' => [File.read('DATASOURCE').chomp]
  }
end

module Jekyll
  class DataCleanup < Jekyll::Generator
    def generate(site)
      %w[assembly_people senate_people].each do |collection|
        site.collections[collection].docs.each do |person|
          person.data['image'] ||= '/images/person-210x210.jpg'
          kuvakazim_identifer = person.data['identifiers'].find { |id| id['scheme'] == 'kuvakazim' }
          next unless kuvakazim_identifer
          person.data['kuvakazim_id'] = kuvakazim_identifer['identifier']
        end
      end
    end
  end
end
