feature "filter tags" do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.kidstoys.com', title: 'Toy Shop', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.toys.com', title: 'SHOP', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario "bubbles filter" do
    visit '/links'
    fill_in :filter_name, with: 'bubbles'
    click_button('Submit')
    expect(page).to have_content('Toy Shop')
  end
end
