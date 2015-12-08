require 'pry'

class Debug < Jekyll::Generator
  def generate(site)
    return unless ENV['JEKYLL_DEBUG']
    $site = site
    warn "You can access the Jekyll::Site object in $site"
    Pry.start
  end
end
