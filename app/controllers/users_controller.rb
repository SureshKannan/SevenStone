class UsersController < ApplicationController
def index
    @page = params[:page]
    if params[:page].nil?
      @page = 1
    else
      if params[:page]==""
        @page = 1
      else
        @page = params[:page]
      end
    end
    if @mode!='search'
      @users=User.all.includes(:role,:group).paginate(:page => @page, :per_page => 10)
    else
      @users=@users.paginate(:page=>@page,:per_page=>10)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def new
    @roles = Role.all
    @groups = Group.all
    @user = User.new
    @mode= params[:mode]
    @page = params[:page]
  end
  def create
    @mode= params[:mode]
    if params[:btnDelete]
        deleteall
        render "delete"
    elsif params[:btnSearch]
        @mode="search"
        search
        render "search"
    elsif params[:btnClear]
        @mode=""
        redirect_to action: 'index'
    else
      @user = User.new(user_params)
      @user.save
      @page = params[:page]
      puts "-------------------------------"
      puts @page
      puts params[:page]
      puts "-------------------------------"
      @users = User.all.paginate(:page =>@page, :per_page => 10)
      respond_to do |f|
         f.js 
      end
    end        
  end
  def edit
    @user = User.find(params[:id])
    @users = User.all
    @roles = Role.all
    @groups = Group.all
    @mode = params[:mode]
    render "new"
  end
  def update
    @user = User.find(params[:id])
    @mode= params[:mode]
    @user.update(user_params)
    respond_to do |f|
      f.js { render "create" }
    end
  end
  def delete
    @user = User.find(params[:id])
    if (@user)
      @user.destroy
    end
    @page = params[:page]
    @users = User.all.paginate(:page =>@page, :per_page => 10)  
  end
  private
    def user_params
      params.require(:user).permit(:id,:firstname,:lastname,:email,:role_id,:group_id,:mode)
    end
end
