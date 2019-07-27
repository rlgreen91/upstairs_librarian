require "dotenv/load"
require "upstairs_librarian/aide"
require "upstairs_librarian/hold_list"
require "upstairs_librarian/researcher"
require "upstairs_librarian/version"

module UpstairsLibrarian
  # Your code goes here...

  # Create our hold list of search terms
  @hold_list = UpstairsLibrarian::HoldList.instance
end
