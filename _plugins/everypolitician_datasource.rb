# Configures the jekyll-everypolitician plugin to use the url in DATASOURCE
Jekyll::Hooks.register :site, :post_read do |site|
  site.config['everypolitician_url'] ||= File.read('DATASOURCE').chomp
end
