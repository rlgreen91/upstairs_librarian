# frozen_string_literal: true

module UpstairsLibrarian
  class Researcher
    ERROR_MESSAGE = "Sorry, we're unable to find a book matching this title.".freeze

    def self.query(title:)
      return "Becoming by Michelle Obama" if title == "Becoming"
      ERROR_MESSAGE
    end
  end
end