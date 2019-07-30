# frozen_string_literal: true

require 'goodreads'
require_relative "./aide"

module UpstairsLibrarian
  class Researcher
    def self.call
      new.call
    end

    def initialize
      @hold_list = UpstairsLibrarian::HoldList.instance
    end

    def call
      search_term = @hold_list.pop
      UpstairsLibrarian::Aide.query(title: search_term)
    end
  end
end