feature do
  scenario do
    visit('/')
    expect(page).to have_content("Bookmarks")
  end
end
