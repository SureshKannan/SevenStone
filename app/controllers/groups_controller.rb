class GroupsController < ApplicationController
    before_action :set_group, only: [:update, :destroy]
 def list
   
 end
  def index
    
     queryString = search
    
    #logger.debug "**Record date #{params[:recordDate]}  *************"
   
    if queryString.empty?
      @pageGroup = Group.pageGroup(params['jtPageSize'],params['jtStartIndex'],params['jtSorting'])
      totalGroups = Group.count
    else
      queryString = "select * from groups " + queryString
      totalGroups = Group.find_by_sql(queryString).count
      queryString += " limit " + params['jtStartIndex'] + " ," + params['jtPageSize']
      @pageGroup = Group.find_by_sql(queryString)
    end
    #@groups = Group.all
    #totalGroup = @groups.count
    render json:{:Result => "OK", :Records => @pageGroup, :TotalRecordCount => totalGroups}
  end

  def create
    @group = Group.new
    @group.name= params['name']
    if @group.save
      render json:{:Result => "OK", :Record => @group}
    else
      render json:{:Result => "ERROR", :Message => @group.errors.full_messages}
    end
  end

  def update
    @group.name = params[:name]
    if @group.save
      render json:{:Result => "OK", :Record => @group}
    else
      render json:{:Result => "ERROR", :Message => @group.errors.full_messages}
    end
  end

  def destroy
    if @group.destroy
      render json: {:Result => "OK"}
    else
      render json:{:Result => "ERROR", :Message => @group.errors.full_messages}
    end
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end
  
  def search

    query = ""
    case
    when params[:name].present?
     # query += " Where name like '%"  + params['name']+ "%'"
      query += " Where name='"  + params['name'] + "'"
 
    end
   # query = "select * from tickets " + query
    logger.debug "**Query #{query}  *************"
    return query
  end
end
