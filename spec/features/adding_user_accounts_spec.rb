feature 'Add user account' do
  scenario 'user is able to enter email and password to signup form' do
    def sign_up
    visit('/users/new')
    fill_in('email', with: 'cat@gmail.com')
    fill_in('password', with: '1234')
    click_button('sign up')
    end
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome cat@gmail.com to Bookmark Manager!')
    expect(User.first.email).to eq ('cat@gmail.com')
  end
end
