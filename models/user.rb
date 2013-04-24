class User < Ohm::Model
	attribute :name
	attribute :email

	def validate
		assert_present :name
		assert_present :email
	end

	def display_attributes
		[name, email].join(', ')
	end

end