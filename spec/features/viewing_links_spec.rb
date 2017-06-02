# require 'spec_helper'

feature 'Viewing saved links' do

  scenario 'I can see a list of links' do

    Link.create(url: 'http://www.google.co.uk', title: 'Google')
    visit('/links')

    # sanity check
    expect(page.status_code).to eq 200
    expect(page).to have_content('http://www.google.co.uk')
  end
end


feature 'viewing links filtered by tags' do
  before(:each) do
    Link.create(url: 'http://www.google.co.uk', title: 'Google', tags: [Tag.first_or_create(name: 'search engine')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'I can filter links by tag' do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)
      expect(page).not_to have_content('Google')
      expect(page).to have_content('Bubble Bobble')
  end
end
