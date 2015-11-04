feature "filter tags" do
  scenario "bubbles filter" do
    visit('/links/new')
    fill_in 'url', with: 'http://www.kidstoys.com'
    fill_in 'title', with: 'Toy Shop'
    fill_in 'name', with: 'bubbles'
    click_button 'Submit'
    click_button 'Filter by Tags'
    visit('/tags/bubbles')
    tag = Tag.first
    expect(tag.links.map(&:title)).to include('Toy Shop')
  end
end
