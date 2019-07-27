# frozen_string_literal: true

require 'goodreads'
require_relative "../aide"

module UpstairsLibrarian
  class Researcher
    WAIT_TIME = ENV.fetch('GOODREADS_WAIT_TIME').freeze

    def self.call
      new.call
    end

    def initialize
      @hold_list = UpstairsLibrarian::HoldList.instance
    end

    def call
      search_term = @hold_list.pop
      UpstairsLibrarian::Aide.query(search_term)
    end
  end
end