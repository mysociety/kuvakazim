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
          person.data['image'] ||= asset_path(site)
          kuvakazim_identifer = person.data['identifiers'].find { |id| id['scheme'] == 'kuvakazim' }
          next unless kuvakazim_identifer
          person.data['kuvakazim_id'] = kuvakazim_identifer['identifier']
        end
      end
    end

    def asset_path(site)
      @asset_path ||= begin
        sprockets = site.sprockets
        asset = sprockets.find_asset('person-210x210.jpg')
        sprockets.prefix_path(sprockets.digest? ? asset.digest_path : asset.logical_path)
      end
    end
  end
end
