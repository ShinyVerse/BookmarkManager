feature 'Bookmark' do
  scenario 'Gives user ability to add a new link to their bookmarks' do
    visit("/")
    fill_in 'title', with: "BAKED BEANS"
    fill_in 'address', with: "http://www.abc.com"
    click_button("ADD")
    expect(page).to have_content "BAKED BEANS"
    expect(page).to have_selector("a[href='http://www.abc.com']")
  end

  scenario 'add bookmark that isnt a real html' do
    visit("/")
    fill_in 'title', with: "BAKED BEANS"
    fill_in 'address', with: "blahblahblah"
    click_button("ADD")
    expect(page).to have_content "Error: Unknown URL"
  end

  scenario 'deletes a bookmark' do
    visit("/")
    fill_in 'title', with: "BAKED BEANS"
    fill_in 'address', with: "http://www.abc.com"
    click_button("ADD")
    first('.bookmarks').click_button('delete')
    expect(page).not_to have_content "BAKED BEANS"
  end
end
