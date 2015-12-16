Jekyll::Search::AlternativeSpellings.register :assembly_people, :senate_people do |person|
  next [] unless person.data.key?('other_names')
  person.data['other_names'].map { |on| on['name'] }
end
