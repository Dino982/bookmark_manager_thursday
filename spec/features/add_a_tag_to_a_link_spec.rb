
feature 'Add a tag' do
  scenario 'able to add a tag to a bookmark' do
    visit('/links/new')
    fill_in('title', with: 'BBC')
    fill_in('url', with: 'http://www.bbc.co.uk')
    fill_in('tags', with: 'news')
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end
end
