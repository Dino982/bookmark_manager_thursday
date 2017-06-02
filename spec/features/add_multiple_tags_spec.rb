feature 'Add multiple tags' do
  scenario 'able to add multiple tags to a bookmark' do
    visit('/links/new')
    fill_in('title', with: 'BBC')
    fill_in('url', with: 'http://www.bbc.co.uk')
    fill_in('tags', with: 'news politics business')
    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:name)).to include('news','politics','business')
  end
end
