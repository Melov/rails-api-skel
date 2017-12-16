class AuthenticationController < ApplicationController
  def login
    @data = requestData()
    @user = User.find_user(@data["username"])
    @pass = @data["password"]

    if @user != nil
      if @user.password == @pass
        @session = @user.sessions.create
        @session.save
        sendResponce(@session, "Login sucessfull")
      else
        throwError(11, "Password incorrect")
      end
    else
      throwError(12, "User not found")
    end
  end

  def register
    @data = requestData()
    @user = User.find_user(@data["username"])
    @pass = @data["password"]

    if @user != nil
      throwError(10, "User already registered")
    else
      @user = User.new(user_params(@data))
      @user.save
      sendResponce(@user, "User registered sucessfull")
    end
  end
  
  def logout
    @data = requestData()
    if Session.find_by(token: @data["token"]) == nil
      throwError(20, "Session didn't exist")
    else
      Session.find_by(token: @data["token"]).destroy
      sendResponce({}, "Session successfully terminated")
    end
  end

  def sessions
    @data = requestData()
    @user = User.find_user(@data["username"])

    if @user != nil
      sendResponce(@user.sessions)
    else
      throwError(12, "User not found")
    end
  end

  private
  def user_params(data)
    return { :username => data["username"], :password => data["password"] }
  end
end
