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

    %w(assembly_organizations senate_organizations).each do |collection|
      site.collections[collection].docs.each do |doc|
        slug = Jekyll::Utils.slugify(doc.data['id'].split('/').last)
        doc.data['redirect_from'] = [
          "/organisation/#{slug}/"
        ]
      end
    end

    %w(assembly_areas senate_areas).each do |collection|
      site.collections[collection].docs.each do |doc|
        slug = Jekyll::Utils.slugify(doc.data['id'].split('/').last)
        # Backward compatibility for this one case where slugs differ
        if slug == 'st-mary-s'
          slug = 'st-marys'
        end
        doc.data['redirect_from'] = [
          "/place/#{slug}/"
        ]
      end
    end
  end
end
