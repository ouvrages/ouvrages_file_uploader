class UploadedFile < ActiveRecord::Base
  attr_accessible :file
  has_attached_file :file,
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:hash/:filename",
    :url => "/system/:class/:attachment/:id_partition/:style/:hash/:filename",
    :hash_secret => ENV["FILEUPLOAD_HASH_SECRET"]
  do_not_validate_attachment_file_type :file
end
