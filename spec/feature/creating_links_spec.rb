# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manag

feature "can save a website" do
  scenario "add link" do
    visit '/links'
    click_button 'Add Link'
    fill_in :url, with: 'http://www.google.co.uk'
    fill_in :title, with: 'Google'
    click_button 'Submit'
    expect(page).to have_content('Google')
  end
end
