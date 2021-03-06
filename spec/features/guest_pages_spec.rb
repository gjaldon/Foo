require_relative '../spec_helper'

describe 'Logging in' do

	before do
    User.create email: 'foo@bar.com', password: 'secret', name: 'Foo Bar'
    visit '/'
	end

  it 'signs in' do
    fill_in "Email", with: "foo@bar.com"
    fill_in "Password", with: "secret"
    click_button 'Login'
    page.has_content?('Signed in!').must_equal true, 'Signed in! not found in content'
  end
end