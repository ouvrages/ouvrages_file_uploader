class UploadedFilesController < ApplicationController
  def file_upload
    # FIX IE
    if request.headers["HTTP_ACCEPT"].split(",").map(&:strip).include?("application/json")
      content_type = "application/json"
    else
      content_type = "text/plain"
    end

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
      }, content_type: content_type
    else
      render json: {
        error: {
          "message" => "An error prevents the uploaded file to be saved"
        }
      }, content_type: content_type
    end
  end
end
