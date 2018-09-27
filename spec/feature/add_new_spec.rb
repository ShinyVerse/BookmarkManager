feature 'Add Bookmark' do
  scenario 'Gives user ability to add a new link to their bookmarks' do
    visit("/")
    fill_in 'address', with: "www.abc.com"
    click_button("ADD")
    expect(page).to have_link("www.abc.com")
  end

  scenario 'add bookmark that isnt a real html' do
    visit("/")
    fill_in 'address', with: "blahblahblah"
    click_button("ADD")
    expect(page).to have_content "Error: Unknown URL"
  end
end
