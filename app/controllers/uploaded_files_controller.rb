class UploadedFilesController < ApplicationController
  def file_upload
    uploaded_file = UploadedFile.new(file: params[:files][0])
    if uploaded_file.save
      render json: {
        files: [
          {
            "name" => uploaded_file.read_attribute(:file_file_name),
            "size" => uploaded_file.read_attribute(:file_file_size),
            "url" => uploaded_file.file.url,
            "id" => uploaded_file.id
          }
        ]
      }
    end
  end
end
