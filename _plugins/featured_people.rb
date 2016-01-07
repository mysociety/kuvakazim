class FeaturedPeople < Jekyll::Generator
  def generate(site)
    featured_people = []
    %w(assembly_people senate_people).each do |collection|
      featured_people << site.collections[collection].docs.find_all { |d| d['image'] }.sample(5)
    end
    site.config['featured_people'] = featured_people.flatten.shuffle
  end
end
