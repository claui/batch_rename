# encoding: utf-8

require 'spec_helper'

Catalog = BatchRename::Catalog
Editor = BatchRename::Editor

describe Editor::DiffMerge do
  before do
    diff_tmp_dir = '/dev/null'
    @catalogs = [
      Catalog.new(:before, 'before', diff_tmp_dir),
      Catalog.new(:after, 'after', diff_tmp_dir)
    ]
  end

  describe 'its arguments' do
    shared_examples 'DiffMerge arguments' do
      it 'have the --nosplash option' do
        expect(@args.include?('--nosplash')).to be true
      end

      it 'include a title for the left-hand side' do
        has_title = @args.any? { |arg| arg.start_with?('-t1=') }
        expect(has_title).to be true
      end

      it 'include a title for the right-hand side' do
        has_title = @args.any? { |arg| arg.start_with?('-t2=') }
        expect(has_title).to be true
      end

      it 'include a file name for the left-hand side' do
        expected_file_name = '/dev/null/Before renaming.utf8'
        has_file_name = @args.include?(expected_file_name)
        expect(has_file_name).to be true
      end

      it 'include a file name for the right-hand side' do
        expected_file_name = '/dev/null/After renaming.utf8'
        has_file_name = @args.include?(expected_file_name)
        expect(has_file_name).to be true
      end
    end

    describe 'without caption' do
      before do
        @args = Editor::DiffMerge.new(@catalogs).args
      end

      it 'do not contain a -c option' do
        has_c_option = @args.any? { |arg| arg.start_with?('-c=') }
        expect(has_c_option).to be false
      end

      it_behaves_like 'DiffMerge arguments'
    end

    describe 'with a caption' do
      before do
        @args = Editor::DiffMerge.new(@catalogs, 'A caption').args
      end

      it 'contain a -c option' do
        expect(@args.include?('-c=A caption')).to be true
      end

      it_behaves_like 'DiffMerge arguments'
    end
  end
end
