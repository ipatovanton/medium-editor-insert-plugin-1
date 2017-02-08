module MediumEditorInsertPlugin
  class Image < ActiveRecord::Base
     mount_uploader :file, ImageUploader
  end
end
