require 'medium-editor/helpers'

namespace :insert_plugin do
  include MediumEditor::Helpers

  task :update do
    puts `bower install medium-editor-insert-plugin components-font-awesome --save`

    copy_asset "bower_components/handlebars/handlebars.runtime.min.js", "handlebars/handlebars.runtime.min.js"
    copy_asset "bower_components/jquery-sortable/source/js/jquery-sortable-min.js", "jquery-sortable/jquery-sortable-min.js"
    copy_asset "bower_components/blueimp-file-upload/js/vendor/jquery.ui.widget.js", "blueimp-file-upload/jquery.ui.widget.js"
    copy_asset "bower_components/blueimp-file-upload/js/jquery.iframe-transport.js", "blueimp-file-upload/jquery.iframe-transport.js"
    copy_asset "bower_components/blueimp-file-upload/js/jquery.fileupload.js", "blueimp-file-upload/jquery.fileupload.js"
    copy_asset "bower_components/medium-editor-insert-plugin/dist/js/medium-editor-insert-plugin.min.js", "medium-editor-insert-plugin/medium-editor-insert-plugin.min.js"

    copy_asset "bower_components/medium-editor-insert-plugin/dist/css/medium-editor-insert-plugin.min.css", "medium-editor-insert-plugin/medium-editor-insert-plugin.min.css"

    copy_asset "bower_components/components-font-awesome/css/font-awesome.min.css", "components-font-awesome/css/font-awesome.min.css"
    FileUtils.cp_r "bower_components/components-font-awesome/fonts", "vendor/assets/stylesheets/components-font-awesome"
  end
end
