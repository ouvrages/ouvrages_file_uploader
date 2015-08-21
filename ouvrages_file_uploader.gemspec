$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ouvrages_file_uploader/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ouvrages_file_uploader"
  s.version     = OuvragesFileUploader::VERSION
  s.authors     = ["Ouvrages"]
  s.email       = ["contact@ouvrages-web.fr"]
  s.homepage    = "http://ouvrages-web.fr"
  s.summary     = "Ouvrages File Uploader"
  s.description = "Ouvrages File Uploader"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.22"
  s.add_dependency "paperclip"
  s.add_dependency "jquery-fileupload-rails"
  s.add_dependency "coffee-rails"
  s.add_dependency "haml_coffee_assets"
  s.add_dependency "haml-rails"
end
