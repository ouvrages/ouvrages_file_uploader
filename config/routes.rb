Rails.application.routes.draw do
  match "file_upload" => "uploaded_files#file_upload", as: :file_upload
end
