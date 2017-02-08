require_dependency "medium_editor_insert_plugin/application_controller"

module MediumEditorInsertPlugin
  class ImagesController < ApplicationController

    def upload
      files = params.require(:files)

      @image = Image.new
      @image.file = files[0]

      if @image.save
        render json: { success: true, files: [{ url: "#{@image.file.url}?id=#{@image.id}" }] }
      else
        render json: { success: false, errors:  @image.errors }, status: :unprocessable_entity
      end
    end

    # insert-plugin is locked on file path of image and it's hard to pass other params
    # for now pass id to file path on uploading and get it on deleting
    def delete
      file = params.require(:file)
      id = file.split("?")[1].gsub("id=", "")
      image = Image.where(id: id).first
      if image
        image.destroy
        render json: { success: true }
      else
        render json: { success: false },  status: :not_found
      end
    end

  end
end
