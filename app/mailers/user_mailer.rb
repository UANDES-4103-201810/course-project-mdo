class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url  = 'http://0.0.0.0:3000/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def buy_promise
    @user = params[:user]
    @promise = params[:promise]
    @url = "http://0.0.0.0:3000/users/"+@user.id.to_s
    mail(to: @user.email, subject: "Approve promise purchase")
  end

  def fund_project
    @user = params[:user]
    @project = params[:project]
    @url = "http://0.0.0.0:3000/users/"+@user.id.to_s
    mail(to: @user.email, subject: "Approve project funding")
  end

end
