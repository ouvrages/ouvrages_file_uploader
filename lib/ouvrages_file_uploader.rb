Gem.loaded_specs['ouvrages_file_uploader'].dependencies.each do |dependency|
  require dependency.name
end

require "ouvrages_file_uploader/engine"

module OuvragesFileUploader
  module ActiveRecordHelpers
    def accepts_uploaded_file_for(attachment)
      attachment_uploaded_file_id = "#{attachment}_uploaded_file_id"
      attr_reader attachment_uploaded_file_id.to_sym
      attr_accessible attachment_uploaded_file_id.to_sym
      define_method("#{attachment_uploaded_file_id}=") do |id|
        unless id.blank?
          instance_variable_set("@#{attachment_uploaded_file_id}", id)
          if uploaded_file = UploadedFile.where(id: id).first
            self.send("#{attachment}=",  File.open(uploaded_file.file.path))
          end
        end
      end
    end
  end
  module Helpers
    def file_upload(form, attachment, options = {})
      render partial: "/uploaded_files/file_upload", locals: { form: form, attachment: attachment, options: options.with_indifferent_access}
    end
  end
end

ActiveRecord::Base.extend OuvragesFileUploader::ActiveRecordHelpers
ActionController::Base.send(:helper, OuvragesFileUploader::Helpers)
