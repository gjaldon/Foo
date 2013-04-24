require_relative 'spec_helper'

describe User do
	let(:user) { User.create name: 'Test', email: 'test@jaldon.com' }

	describe '#display_attributes' do
	  it 'returns all attributes in a comma-delimited format' do
	    user.display_attributes.must_equal 'Test, test@jaldon.com'
	  end
	end
end