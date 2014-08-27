class RolesController < ApplicationController
  before_action :set_role, only: [:update, :destroy]
  def list
    
  end
  def jtable1
    c =Custom.new
    cs = []
    roles = Role.all
    roles.each do |r|
      c.DisplayText = r.name
      c.Value = r.id
      cs << c.serializable_hash
    end   
    return cs
  end
  def index1
    roleHash = jtable1
    logger.debug "*****     D #{roleHash} *********************"
  
    
    render json:{:Result => "OK", :Options => roleHash}
  end
  def index
    
     queryString = search
    
    #logger.debug "**Record date #{params[:recordDate]}  *************"
   
    if queryString.empty?
      @pageRole = Role.pageRole(params['jtPageSize'],params['jtStartIndex'],params['jtSorting'])
      totalRoles = Role.count
    else
      queryString = "select * from roles " + queryString
      totalRoles = Role.find_by_sql(queryString).count
      queryString += " limit " + params['jtStartIndex'] + " ," + params['jtPageSize']
      @pageRole = Role.find_by_sql(queryString)
    end
    #@roles = Role.all
    #totalRole = @roles.count
    render json:{:Result => "OK", :Records => @pageRole, :TotalRecordCount => totalRoles}
  end

  def create
    @role = Role.new
    @role.name= params['name']
    if @role.save
      render json:{:Result => "OK", :Record => @role}
    else
      render json:{:Result => "ERROR", :Message => @role.errors.full_messages}
    end
  end

  def update
    @role.name = params[:name]
    if @role.save
      render json:{:Result => "OK", :Record => @role}
    else
      render json:{:Result => "ERROR", :Message => @role.errors.full_messages}
    end
  end

  def destroy
    if @role.destroy
      render json: {:Result => "OK"}
    else
      render json:{:Result => "ERROR", :Message => @role.errors.full_messages}
    end
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
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
