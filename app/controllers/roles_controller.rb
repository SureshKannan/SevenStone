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
    
  end
  def create
    
  end
  private
    def roles_params
      params.require(:roles).permit(:id,:name,:mode)
    end
end
