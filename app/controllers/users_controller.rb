class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    authorize! :list, @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    fund = params[:fund]
    buy = params[:buy]
    unless fund.nil?
      Fund.find(fund).update(:approved => true)
    end
    unless buy.nil?
      Buy.find(buy).update(:approved => true)
    end

    wishlist = []
    if user_signed_in?
      wishlist = current_user.my_wishlist
    end
    @info = {
        wishlist: wishlist,
        projects: Project.where(:user_id => params[:id]),
        funded: current_user.all_funded
    }

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save

        UserMailer.with(user: @user).welcome_email.deliver_later

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:admin, :password, :email, :address, :name, :last_name, :image, :birth_date, :security_question, :security_answer, :last_login)
    end
end
