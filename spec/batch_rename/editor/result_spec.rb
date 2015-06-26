# encoding: utf-8

require 'spec_helper'

Editor = BatchRename::Editor

describe Editor::Result do
  before(:all) do
    @diff_tmp_dir = Dir.mktmpdir('batch-rename-')

    File.open "#{ @diff_tmp_dir }/Before renaming.utf8", "w" do |file|
      file.write <<-EOF.undent
        foo
        bar
        baz
      EOF
    end

    File.open "#{ @diff_tmp_dir }/After renaming.utf8", "w" do |file|
      file.write <<-EOF.undent
        foo.txt
        bar
        baz.qux
      EOF
    end
  end

  before do
    catalogs = [
      Catalog.new(:before, 'before', @diff_tmp_dir),
      Catalog.new(:after, 'after', @diff_tmp_dir)
    ]
    @result = Editor::Result.new(catalogs)
  end

  it 'has a total count' do
    expect(@result.total_count).to equal(3)
  end

  it 'has a modified count' do
    expect(@result.modified_count).to equal(2)
  end

  describe 'pairs' do
    before do
      @pairs = @result.pairs
    end

    it 'contain foo' do
      has_foo = @pairs.include?(['foo', 'foo.txt'])
      expect(has_foo).to be true
    end

    it 'contain bar' do
      has_foo = @pairs.include?(['bar', 'bar'])
      expect(has_foo).to be true
    end

    it 'contain baz' do
      has_foo = @pairs.include?(['baz', 'baz.qux'])
      expect(has_foo).to be true
    end
  end

  describe 'modified_pairs' do
    before do
      @modified_pairs = @result.modified_pairs
    end

    it 'contain foo' do
      has_foo = @modified_pairs.include?(['foo', 'foo.txt'])
      expect(has_foo).to be true
    end

    it 'does not contain bar' do
      has_foo = @modified_pairs.include?(['bar', 'bar'])
      expect(has_foo).to be false
    end

    it 'contain baz' do
      has_foo = @modified_pairs.include?(['baz', 'baz.qux'])
      expect(has_foo).to be true
    end
  end
end
