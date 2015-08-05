Gem.loaded_specs['ouvrages_file_uploader'].dependencies.each do |dependency|
  require dependency.name
end

require "ouvrages_file_uploader/engine"

module OuvragesFileUploader
end
