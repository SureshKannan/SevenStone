class UsersController < ApplicationController
   before_action :set_user, only: [:update, :destroy]
 def list
   
 end
  def index
    
     queryString = search
    
    #logger.debug "**Record date #{params[:recordDate]}  *************"
   
    if queryString.empty?
      @pageUser = User.pageUser(params['jtPageSize'],params['jtStartIndex'],params['jtSorting'])
      totalUsers = User.count
    else
      queryString = "select * from users " + queryString
      totalUsers = User.find_by_sql(queryString).count
      queryString += " limit " + params['jtStartIndex'] + " ," + params['jtPageSize']
      @pageUser = User.find_by_sql(queryString)
    end

    render json:{:Result => "OK", :Records => @pageUser, :TotalRecordCount => totalUsers}
  end

  def create
    @user = User.new
    @user.firstname= params['firstname']
    @user.lastname= params['lastname']
    @user.email= params['email']

     @user.role_id = params['role_id']
     @user.group_id = params['group_id']
    #logger.debug "**Query #{roleID.id}  *************"
    if @user.save
      render json:{:Result => "OK", :Record => @user}
    else
      render json:{:Result => "ERROR", :Message => @user.errors.full_messages}
    end
  end

  def update
   # @user.name = params[:firstname]
   @user.role_id = params['role_id']
     @user.group_id = params['group_id']
    if @user.save
      logger.debug "**update #{@user.group_id}  *************"
      render json:{:Result => "OK", :Record => @user}
    else
      render json:{:Result => "ERROR", :Message => @user.errors.full_messages}
    end
  end

  def destroy
    if @user.destroy
      render json: {:Result => "OK"}
    else
      render json:{:Result => "ERROR", :Message => @user.errors.full_messages}
    end
  end

  def roleOption
   roleHash = jtableOption(Role)  
     logger.debug "*****    from roleOption  #{roleHash} *********************"
    render json:{:Result => "OK", :Options => roleHash}
  end
  def groupOption
    groupHash = jtableOption(Group)
    render json:{:Result => "OK", :Options => groupHash}
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
  
  def search

    query = ""
    case
    when params[:firstname].present?
     # query += " Where name like '%"  + params['name']+ "%'"
      query += " Where firstname='"  + params['firstname'] + "'"
 
    end
   # query = "select * from tickets " + query
    logger.debug "**Query #{query}  *************"
    return query
  end

end
