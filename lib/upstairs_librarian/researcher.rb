# frozen_string_literal: true

require 'goodreads'

module UpstairsLibrarian
  class Researcher
    ERROR_MESSAGE = "Sorry, I'm unable to find a book matching this title.".freeze
    KEY = ENV.fetch('GOODREADS_API_KEY').freeze
    SECRET = ENV.fetch('GOODREADS_API_SECRET').freeze


    def self.query(title:)
      new.call(parameter: title)
    end

    def initialize
      @aide = Goodreads::Client.new(api_key: KEY, api_secret: SECRET)
    end

    def call(parameter:)
      begin
        result = @aide.book_by_title(parameter)
        extract_book_info(book: result)
      rescue Goodreads::NotFound
        ERROR_MESSAGE
      end
    end

    private

    def extract_book_info(book:)
      book_info = {
        title: book.title,
        publication_year: book.publication_year,
        description: book.description,
        url: book.url,
        authors: []
      }

      book_info.tap do |info_hash|
        author_info = book.authors.author
        if author_info.kind_of?(Array)
          author_info.take(3).each { |author| info_hash[:authors] << author.name }
        else
          info_hash[:authors] << author_info.name
        end
      end
    end
  end
end