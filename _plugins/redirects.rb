# Configures legacy urls to redirect to new ones with EveryPolitician ids in the url
class RedirectGenerator < Jekyll::Generator
  priority :high

  def generate(site)
    slug_mapping = site.data['people_slugs']
    %w(assembly_people senate_people).each do |collection|
      site.collections[collection].docs.each do |doc|
        kuvakazim_identifier = doc.data['identifiers'].find { |id| id['scheme'] == 'kuvakazim' }
        next unless kuvakazim_identifier
        doc.data['redirect_from'] = [
          "/person/#{slug_mapping[kuvakazim_identifier['identifier'].to_s]}/"
        ]
      end
    end
  end
end
