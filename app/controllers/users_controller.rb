class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :destroy]
  skip_before_filter :check_sign_in, only: [:new, :create]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_name(params[:id])
    respond_to do |format|
      format.js
    end
    
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
        format.html { 
          sign_in @user          
          redirect_to root_url, notice: 'User was successfully created.'
        }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  	if @user == current_user
	    respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to user_path(@user.name), notice: 'User was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
  	if @user == current_user
	    @user.destroy
	    respond_to do |format|
	      format.html { redirect_to users_url }
	      format.json { head :no_content }
	    end
	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :group, :email, :password, :password_confirmation)
    end
end

