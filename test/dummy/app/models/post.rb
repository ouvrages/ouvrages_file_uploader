class Post < ActiveRecord::Base
  attr_accessible :content, :title, :image
  has_attached_file :image
  accepts_uploaded_file_for :image
  do_not_validate_attachment_file_type :image
end
