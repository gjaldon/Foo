require_relative '../spec_helper'

class GuestPages < AcceptanceTest
	describe 'visiting root page' do
		before do
			visit '/'
      User.create email: 'foo@bar.com', password: 'secret', name: 'Foo Bar'
		end

	  it 'allows user to sign in' do
	    fill_in "Email", with: "foo@bar.com"
      fill_in "Password", with: "secret"
      click_button 'Login'
      page.has_content?('Signed in!').must_equal true, 'Signed in! not found in content'
	  end
	end
end