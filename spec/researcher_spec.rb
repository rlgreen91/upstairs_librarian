# frozen_string_literal: true

require "upstairs_librarian/hold_list"
require "upstairs_librarian/researcher"
require "vcr_setup"

RSpec.describe UpstairsLibrarian::Researcher do
  before do
    UpstairsLibrarian::HoldList.instance.push(item: "Becoming")
  end

  it 'returns a book given its title', :vcr do
    book_info = UpstairsLibrarian::Researcher.call
    expect(book_info[:publication_year]).to eql('2018')
    expect(book_info[:authors]).to eql(['Michelle Obama'])
  end
end