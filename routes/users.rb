class Users < Cuba
	define do

	  on 'dashboard' do
	  	on get do
	    	render("users/dashboard", user: current_user)
	    end
	  end

	end
end