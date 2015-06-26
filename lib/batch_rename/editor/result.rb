# encoding: utf-8

module BatchRename
  class Editor::Result
    attr_reader :catalogs

    def total_count
      pairs.length
    end

    def modified_count
      modified_pairs.length
    end

    def pairs
      @pairs = lines.reduce(&:zip)
    end

    def modified_pairs
      @modified_pairs ||= pairs.select { |a| a.reduce(&:!=) }
    end

    def to_s
      pairs.to_s
    end

    private

    def initialize(catalogs)
      @catalogs = catalogs
    end

    def lines
      @lines ||= catalogs.map do |catalog|
        File.open(catalog.file_name).each.map(&:chop)
      end
    end
  end
end
