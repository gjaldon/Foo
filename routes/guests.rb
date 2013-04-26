class Guests < Cuba
  define do

    on root do
      on get do
        email = current_user ? current_user.email : ''
        render("guests/login", email: email)
      end

      on post, param("email"), param("password") do |email, pass|
        if login(User, email, pass, req[:remember])
          session[:success] = "Signed in!"
          res.redirect "/"
        else
          session[:error] = "Incorrect email or password!"
          res.write("Failed!")
        end
      end

      on default do
        session[:error] = "No username and/or password supplied"
        res.redirect "/login", 303
      end
    end

    on "register" do
      on get do
        render("register")
      end

      on post, param("user") do |params|
        user = User.new(params)

        begin
          if user.save
            authenticate(user)
            session[:success] = "You have successfully signed up."
            res.redirect "/", 303
          else
            render("register", title: "Register", user: user)
          end
        rescue Ohm::UniqueIndexViolation
          session[:error] = "That email has been taken."
          render("register", title: "Register", user: user)
        end
        
      end
    end

  end
end