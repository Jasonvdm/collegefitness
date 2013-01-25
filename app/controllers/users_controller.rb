class UsersController < ApplicationController

  before_filter :find_user, except: [:index]
  before_filter :user_signed_in?
  before_filter :admin_allow, only: [:index]
  before_filter :is_owner?, only: [:index, :edit, :update, :destroy, :workspace]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def signed_in
    redirect_to user_path(current_user)  
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
    redirect_to user_path(@user)
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
        redirect_to user_path(@user)
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    number = params[:user][:number]
    result = /(?:(?:(?:\+?1)|(?:\(\+?1\)))?(?:(?:\s*)|-)([0-9]{3})(?:-|\s+)([0-9]{3})(?:-|\s+)([0-9]{4})|([0-9]{10}))/.match(number)
    number = "#{result[1]}" + "#{result[2]}" + "#{result[3]}" + "#{result[4]}"
    params[:user][:number] = number
    carrier = params[:user][:carrier]
    if carrier == "Verizon"
      params[:user][:number_path] = "#{number}" + "@vtext.com"
    elsif carrier == "AT&T"
      params[:user][:number_path] = "#{number}" + "@txt.att.net"
    elsif carrier == "T-Mobile"
      params[:user][:number_path] = "#{number}" + "@tmomail.net"
    elsif carrier == "Sprint"
      params[:user][:number_path] = "#{number}" + "@messaging.sprintpcs.com"
    elsif carrier == "Virgin Mobile"
      params[:user][:number_path] = "#{number}" + "@vmobl.com"
    elsif carrier == "US Cellular"
      params[:user][:number_path] = "#{number}" + "@email.uscc.net"
    end
    params[:user][:equipment_owned] = params[:user][:equipment_owned].join(", ")
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_index_path }
      format.json { head :no_content }
    end
  end

  def increase_difficulty
    @user = User.find(params[:id])
    curr_difficulty = @user.current_level_difficulty
    if curr_difficulty == "Beginner"
      @user.current_level_difficulty = "Intermediate"
    elsif curr_difficulty == "Intermediate"
      @user.current_level_difficulty = "Advanced"
    end  
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_url(@student), notice: "You have increased the difficulty of your workouts!" }
        format.json { head :no_content }
      else
        format.html { redirect_to user_url(@student), notice: "Error updating your profile" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def decrease_difficulty
    @user = User.find(params[:id])
    curr_difficulty = @user.current_level_difficulty
    if curr_difficulty == "Advanced"
      @user.current_level_difficulty = "Intermediate"
    elsif curr_difficulty == "Intermediate"
      @user.current_level_difficulty = "Beginner"
    end  
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_url(@student), notice: "You have decreased the difficulty of your workouts!" }
        format.json { head :no_content }
      else
        format.html { redirect_to user_url(@student), notice: "Error updating your profile" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  ###
  # Filters
  ###

  def admin_allow
    if !is_admin?
      flash[:error] = general_error
      redirect_to root_url
    end
  end

   def find_user
    @user = User.where(id: params[:id])[0]
    puts @user
    if @user.nil?
      flash[:error] = error_404
      redirect_to root_url  
      return
    end
  end


   def is_owner?
    return true if is_admin?
    if current_user != @user
      flash[:error] = general_error
      redirect_to root_path
    end
  end

end
