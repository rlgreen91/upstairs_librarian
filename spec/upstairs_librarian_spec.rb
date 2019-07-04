# frozen_string_literal: true

require "upstairs_librarian"
require "vcr_setup"

RSpec.describe UpstairsLibrarian::Researcher do
  it 'returns a book given its title', :vcr do
    book_info = UpstairsLibrarian::Researcher.query(title: "Becoming")
    expect(book_info[:publication_year]).to eql('2018')
    expect(book_info[:authors]).to eql(['Michelle Obama'])
  end

  it 'returns a message if a book cannot be matched to a title', :vcr do
    error_message = "Sorry, I'm unable to find a book matching this title."
    expect(UpstairsLibrarian::Researcher.query(title: "Ekecorab")).to eql(error_message)
  end

  it 'returns a book written by multiple authors', :vcr do
    book_info = UpstairsLibrarian::Researcher.query(title: "Good Omens")
    expect(book_info[:authors]).to eql(['Terry Pratchett', 'Neil Gaiman'])
  end
end