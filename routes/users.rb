class Users < Cuba
	define do

	  on 'dashboard' do
	  	on get do
	    	render("users/dashboard")
	    end
	  end

	end
end