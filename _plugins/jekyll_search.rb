Jekyll::Search::AlternativeSpellings.register :assembly_people, :senate_people do |person|
  if person.data.key?('other_names')
    person.data['other_names'].map { |other_name| other_name['name'] }
  end
end
