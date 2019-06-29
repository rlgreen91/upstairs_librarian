# frozen_string_literal: true

require "upstairs_librarian"

RSpec.describe UpstairsLibrarian::Researcher do
  it 'returns a book given its title' do
    expect(UpstairsLibrarian::Researcher.query(title: "Becoming")).to eql("Becoming by Michelle Obama")
  end

  it 'returns a message if a book cannot be matched to a title' do
    error_message = "Sorry, we're unable to find a book matching this title."
    expect(UpstairsLibrarian::Researcher.query(title: "Yesterday")).to eql(error_message)
  end
end