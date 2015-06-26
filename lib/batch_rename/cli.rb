# encoding: utf-8

require 'batch_rename'

module BatchRename
  class CLI
    EXIT_CODE_SUCCESS = 0
    EXIT_CODE_FAILURE = 1

    EDITOR = Editor::DiffMerge

    INSTRUCTIONS = {
      :before => "Original file names – do not edit the field below",
      :after => "Rename your files below. Press ⌘S to save, ⌘Q to quit"
    }

    attr_reader :catalogs, :diff_tmp_dir

    def self.run!
      begin
        CLI::new.run!
        exit EXIT_CODE_SUCCESS
      rescue Editor::EditorNotFoundError => e
        warn e.message
        exit EXIT_CODE_FAILURE
      end
    end

    def run!
      caption = "batch_rename v#{VERSION} - #{ Dir.pwd }"
      write_catalog_files!

      puts 'Launching graphical editor…'
      result = EDITOR.new(catalogs, caption).launch!.result

      puts "Renaming #{ result.modified_count } file(s)"
      puts rename!(result)
    end

    private

    def initialize
      @diff_tmp_dir = Dir.mktmpdir('batch-rename-')

      @catalogs = [
        Catalog.new(:before, INSTRUCTIONS[:before], diff_tmp_dir),
        Catalog.new(:after, INSTRUCTIONS[:after], diff_tmp_dir)
      ]
    end

    def write_catalog_files!
      `ls -A | tee #{ catalogs.map(&:escaped_file_name).join(' >') }`
    end

    def rename!(result)
      result.modified_pairs
        .map { |pair| pair.map(&Shellwords.method(:escape)) }
        .map { |a, b| `mv -nv #{a} #{b}` }
    end
  end
end
