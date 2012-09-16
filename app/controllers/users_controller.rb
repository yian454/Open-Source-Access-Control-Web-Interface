class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  
  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    #authorize! :read, @users
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #@user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # PUT /users/1/upload
  def upload
    #@user = User.find(params[:id])
    @upload_result = @user.upload_to_door

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @upload_result }
    end
  end

  # PUT /users/upload_all
  def upload_all
    @upload_result = User.upload_all_to_door

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @upload_result }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    #@user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    #@user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    #@user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    #@user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #@user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, :notice => 'User successfully deleted.' }
      format.json { head :no_content }
    end
  end
end