Rails.application.routes.draw do
  match "file_upload" => "uploaded_files#resend_file", as: :resend_file
end
