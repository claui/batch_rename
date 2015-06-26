# encoding: utf-8

module BatchRename
  class Editor::EditorNotFoundError < StandardError
    attr_reader :path

    def message
      "Unable to launch \"#{ path }\"; is DiffMerge installed?"
    end

    private

    def initialize(path)
      @path = path
    end
  end
end