class PriorityController < ApplicationController
  before_action :set_priority, only: [:update, :destroy]
  def list
    
  end
  
  def index    
     queryString = search    
    #logger.debug "**Record date #{params[:recordDate]}  *************"
   
    if queryString.empty?
      @pageStatus = Priority.pageStatus(params['jtPageSize'],params['jtStartIndex'],params['jtSorting'])
      totalPriorities = Priority.count
    else
      queryString = "select * from priorities " + queryString
      totalPriorities = Priority.find_by_sql(queryString).count
      queryString += " limit " + params['jtStartIndex'] + " ," + params['jtPageSize']
      @pageStatus = Priority.find_by_sql(queryString)
    end
    logger.debug "**query #{queryString}  *************"
    render json:{:Result => "OK", :Records => @pageStatus, :TotalRecordCount => totalPriorities}
  end

  def create
     logger.debug "**Record date #{params[:name]}  *************"
    @priority = Priority.new
    @priority.name= params['name']
    logger.debug "**@priority #{@priority}  *************"
    if @priority.save
      render json:{:Result => "OK", :Record => @priority}
    else
      render json:{:Result => "ERROR", :Message => @priority.errors.full_messages}
    end
  end

  def update
    @priority.name = params[:name]
    if @priority.save
      render json:{:Result => "OK", :Record => @priority}
    else
      render json:{:Result => "ERROR", :Message => @priority.errors.full_messages}
    end
  end

  def destroy
    if @priority.destroy
      render json: {:Result => "OK"}
    else
      render json:{:Result => "ERROR", :Message => @priority.errors.full_messages}
    end
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_priority
    @priority = Priority.find(params[:id])
  end
  
  def search

    query = ""
    case
    when params[:name].present?
      query += " Where name like '%"  + params['name']+ "%'"
      #query += " Where name='"  + params['name'] + "'"
 
    end
   # query = "select * from tickets " + query
    logger.debug "**Query #{query}  *************"
    return query
  end
end
