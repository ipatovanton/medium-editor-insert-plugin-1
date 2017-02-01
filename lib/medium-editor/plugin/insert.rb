require 'medium-editor/plugin/base'

module MediumEditor
  module Plugin
    class Insert < ::MediumEditor::Plugin::Base
      def self.javascripts
        ["medium-editor-insert-plugin"]
      end

      def self.stylesheets
        ["medium-editor-insert-plugin"]
      end
    end
  end
end
