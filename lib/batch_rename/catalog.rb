module BatchRename
  class Catalog
    attr_reader :section, :title, :diff_tmp_dir

    def escaped_file_name
      Shellwords.escape(file_name)
    end

    def file_name
      "#{ diff_tmp_dir }/#{ section.capitalize } renaming.utf8"
    end

    private

    def initialize(section, title, diff_tmp_dir)
      @section = section
      @title = title
      @diff_tmp_dir = diff_tmp_dir
    end
  end
end
