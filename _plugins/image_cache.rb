module Jekyll
  class ImageCache < Jekyll::Generator
    def generate(site)
      %w[assembly_people senate_people].each do |collection|
        site.collections[collection].docs.each do |person|
          if person.data['image']
            house = collection == 'assembly_people' ? 'Assembly' : 'Senate'
            person.data['image'] = "https://everypolitician.github.io/zimbabwe-images/#{house}/#{person.data['id']}.jpeg"
          end
        end
      end
    end
  end
end
