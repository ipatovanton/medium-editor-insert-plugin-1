require_dependency "medium_editor_insert_plugin/application_controller"

module MediumEditorInsertPlugin
  class ImagesController < ApplicationController

    def upload
      @image ||= build_image
      @image.file = image_file

      if @image.save
        render json: { success: true, files: [{ url: "#{@image.file.url}?id=#{@image.id}" }] }
      else
        render json: { success: false, errors:  @image.errors }, status: :unprocessable_entity
      end
    end

    # insert-plugin is locked on file path of image and it's hard to pass other params
    # for now pass id to file path on uploading and get it on deleting
    def delete
      @image ||= find_image
      @image.destroy
      render json: { success: true }
    end

    protected

    def build_image
      Image.new
    end

    def find_image
      Image.find image_id
    end

    def image_id
      file = params.require(:file)
      file.split("?")[1].to_s.gsub("id=", "")
    end

    def image_file
      files = params.require(:files)
      files[0]
    end

  end
end
