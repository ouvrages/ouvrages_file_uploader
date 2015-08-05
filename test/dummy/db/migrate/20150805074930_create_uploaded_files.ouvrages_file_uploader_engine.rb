# This migration comes from ouvrages_file_uploader_engine (originally 20150805074343)
class CreateUploadedFiles < ActiveRecord::Migration
  def change
    create_table :uploaded_files do |t|

      t.timestamps
    end
  end
end
