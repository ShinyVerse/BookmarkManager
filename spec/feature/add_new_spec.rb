feature 'Add Bookmark' do
  scenario 'Gives user ability to add a new link to their bookmarks' do
    visit("/")
    fill_in 'address', with: "www.google.com"
    find("ADD").click
    expect(page).to have_content("www.google.com")
  end
end
