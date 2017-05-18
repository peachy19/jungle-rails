require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      firstname: 'First',
      lastname: 'User',
      email: 'first@user.com',
      password: '12345678',
      password_confirmation: '12345678'
    )
  end
  scenario 'user is authenticated on log-in' do
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: '12345678'

      click_button 'Log in'
    end

    save_screenshot 'login-testing.png'
    expect(page).to have_content 'Signed in as First'

  end
end
