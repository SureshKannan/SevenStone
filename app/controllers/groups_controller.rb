class GroupsController < ApplicationController
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
      @groups=Group.all.paginate(:page => @page, :per_page => 10)
    else
      @groups=@groups.paginate(:page=>@page,:per_page=>10)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def new
    @group = Group.new
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
      @group = Group.new(group_params)
      @group.save
      @page = params[:page]
      puts "-------------------------------"
      puts @page
      puts params[:page]
      puts "-------------------------------"
      @groups = Group.all.paginate(:page =>@page, :per_page => 10)
      respond_to do |f|
         f.js 
      end
    end        
  end
  def edit
    @group = Group.find(params[:id])
    @groups = Group.all
    @mode = params[:mode]
    render "new"
  end
  def update
    @group = Group.find(params[:id])
    @mode= params[:mode]
    @group.update(group_params)
    respond_to do |f|
      f.js { render "create" }
    end
  end
  def delete
    @group = Group.find(params[:id])
    if (@group)
      @group.destroy
    end
    @page = params[:page]
    @groups = Group.all.paginate(:page =>@page, :per_page => 10)  
  end
  private
    def group_params
      params.require(:group).permit(:id,:name,:mode)
    end
end
