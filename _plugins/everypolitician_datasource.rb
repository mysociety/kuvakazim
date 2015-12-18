require 'open-uri/cached'
require 'json'

OpenURI::Cache.cache_path = '.cache'

# Configures the jekyll-everypolitician plugin to use the url in DATASOURCE
Jekyll::Hooks.register :site, :after_reset do |site|
  datasources = JSON.parse(File.read(File.join(site.source, 'datasources.json')))
  site.config['everypolitician'] ||= {
    'sources' => {
      'assembly' => datasources['assembly']['popolo'],
      'senate' => datasources['senate']['popolo']
    }
  }
end

module Jekyll
  class DataCleanup < Jekyll::Generator
    def generate(site)
      %w[assembly_people senate_people].each do |collection|
        site.collections[collection].docs.each do |person|
          kuvakazim_identifer = person.data['identifiers'].find { |id| id['scheme'] == 'kuvakazim' }
          next unless kuvakazim_identifer
          person.data['kuvakazim_id'] = kuvakazim_identifer['identifier']
        end
      end
    end
  end
end
