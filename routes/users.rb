class Users < Cuba

	define do

	  on get do
	  	on "users" do
	  		user = User.create(name: 'Andoni', email: 'gjaldon@test.com')
	    	render("form", user: user)
	    end
	  end
	end
end