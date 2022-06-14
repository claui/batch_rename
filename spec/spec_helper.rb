$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'batch_rename'

class String
  def undent
    indentation = slice(/^\s+/).length
    gsub(/^.{#{ indentation }}/, '')
  end
end
