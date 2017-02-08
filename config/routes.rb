MediumEditorInsertPlugin::Engine.routes.draw do
  post "images/upload" => "images#upload"
  post "images/delete" => "images#delete"
end
