class RolesController < ApplicationController
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
      @roles=Role.all.paginate(:page => @page, :per_page => 10)
    else
      @roles=@roles.paginate(:page=>@page,:per_page=>10)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def new
    @role = Role.new
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
      @role = Role.new(role_params)
      @role.save
      @page = params[:page]
      puts "-------------------------------"
      puts @page
      puts params[:page]
      puts "-------------------------------"
      @roles = Role.all.paginate(:page =>@page, :per_page => 10)
      respond_to do |f|
         f.js 
      end
    end        
  end
  def deleteall
    @Cattypes= params[:ps] 
    @Cattypes.each { |f| 
      @Cattype = Categorytype.find(f)
      if (@Cattype)
      @Cattype.destroy
      end
     }
    @page = params[:page]
    @Categorytypes = Categorytype.all.paginate(:page =>@page, :per_page => 10)   
  end
  def delete
    @role = Role.find(params[:id])
    if (@role)
      @role.destroy
    end
    @page = params[:page]
    @roles = Role.all.paginate(:page =>@page, :per_page => 10)  
  end
  private
    def role_params
      params.require(:role).permit(:id,:name,:mode)
    end
end
