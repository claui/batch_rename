# encoding: utf-8

module BatchRename
  class Editor::DiffMerge < Editor::EditorBase
    PATH = '/usr/local/bin/diffmerge'

    def launch!
      unless system(PATH, *args)
        raise(Editor::EditorNotFoundError.new(PATH))
      end
      self
    end

    def args
      args = ['--nosplash']
      args << "-c=#{ caption }" if caption

      catalogs.each_with_index do |catalog, index|
        args << "-t#{ index+1 }=#{ catalog.title }"
        args << catalog.file_name
      end

      args
    end
  end
end
