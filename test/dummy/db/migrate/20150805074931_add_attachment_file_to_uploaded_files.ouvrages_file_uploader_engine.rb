# This migration comes from ouvrages_file_uploader_engine (originally 20150805074626)
class AddAttachmentFileToUploadedFiles < ActiveRecord::Migration
  def self.up
    add_attachment :uploaded_files, :file
  end

  def self.down
    remove_attachment :uploaded_files, :file
  end
end
