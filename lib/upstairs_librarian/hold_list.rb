# frozen_string_literal: true

require 'singleton'

module UpstairsLibrarian
  class HoldList
    include Singleton

    def initialize
      @list = Array.new
    end

    def push(item:)
      @list << item
    end

    def pop
      @list.shift
    end
  end
end