MediumEditorInsertPlugin::Engine.routes.draw do
  post "images/upload" => "images#upload"
end
