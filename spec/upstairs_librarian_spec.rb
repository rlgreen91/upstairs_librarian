# frozen_string_literal: true

require "upstairs_librarian"
require "vcr_setup"

RSpec.describe UpstairsLibrarian::Aide do
  it 'returns a book given its title', :vcr do
    book_info = UpstairsLibrarian::Aide.query(title: "Becoming")
    expect(book_info[:publication_year]).to eql('2018')
    expect(book_info[:authors]).to eql(['Michelle Obama'])
  end

  it 'returns an empty hash if a book cannot be matched to a title', :vcr do
    expect(UpstairsLibrarian::Aide.query(title: "Ekecorab")).to eql({})
  end

  it 'returns a book written by multiple authors', :vcr do
    book_info = UpstairsLibrarian::Aide.query(title: "Good Omens")
    expect(book_info[:authors]).to eql(['Terry Pratchett', 'Neil Gaiman'])
  end
end