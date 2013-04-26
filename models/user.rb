class User < Ohm::Model
  include Shield::Model

	attribute :name
	attribute :email
  attribute :crypted_password
  unique :email

  def self.fetch(email)
    with(:email, email)
  end

	def validate
		assert_present :name
    assert_present :email
    assert_present :crypted_password
	end

	def display_attributes
		[name, email].join(', ')
	end

end