require 'rails_helper'


feature 'the signup process' do
    scenario 'has a new user page'do 
        visit new_user_url
        expect(page).to have_content 'New user'
    end

  feature 'signing up a user' do
    before(:each) do
        visit new_user_url
        fill_in 'username', with: 'testing_username'
        fill_in 'password', with: 'biscuits'
        click_on 'Create User'
        
      end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'testing_username'
    end
  end
end

feature 'logging in' do
  let!(:user) { create(:user) }
  scenario 'shows username on the homepage after login' do 
    user.save!
    login_as(user)
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end