class SessionsController < ApplicationController
  def new
  end

  def create
    @person = Person.where(:email => params[:session][:email]).first

    if @person == nil || !@person.authenticate(params[:session][:password])
      flash[:error] = "Invalid email/password combination"
      render 'new'
    else
      session[:remember_token] = @person.id
      @current_person = @person
      redirect_to root_path
    end

  end

  def destroy
    session.delete(:remember_token)
    redirect_to root_path
  end

end
