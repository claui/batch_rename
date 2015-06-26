# encoding: utf-8

module BatchRename
  class Editor::EditorBase
    attr_reader :catalogs, :caption

    def result
      @result ||= Editor::Result.new(catalogs)
    end

    private

    def initialize(catalogs, caption = nil)
      @catalogs = catalogs
      @caption = caption
    end
  end
end
