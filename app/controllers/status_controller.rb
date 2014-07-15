class StatusController < ApplicationController
  before_action :set_status, only: [:update, :destroy]
  def list
    
  end
  
  def index    
     queryString = search    
    #logger.debug "**Record date #{params[:recordDate]}  *************"
   
    if queryString.empty?
      @pageStatus = Status.pageStatus(params['jtPageSize'],params['jtStartIndex'],params['jtSorting'])
      totalStatuses = Status.count
    else
      queryString = "select * from statuses " + queryString
      totalStatuses = Status.find_by_sql(queryString).count
      queryString += " limit " + params['jtStartIndex'] + " ," + params['jtPageSize']
      @pageStatus = Status.find_by_sql(queryString)
    end
    logger.debug "**query #{queryString}  *************"
    render json:{:Result => "OK", :Records => @pageStatus, :TotalRecordCount => totalStatuses}
  end

  def create
     logger.debug "**Record date #{params[:name]}  *************"
    @status = Status.new
    @status.name= params['name']
    logger.debug "**@status #{@status}  *************"
    if @status.save
      render json:{:Result => "OK", :Record => @status}
    else
      render json:{:Result => "ERROR", :Message => @status.errors.full_messages}
    end
  end

  def update
    @status.name = params[:name]
    if @status.save
      render json:{:Result => "OK", :Record => @status}
    else
      render json:{:Result => "ERROR", :Message => @status.errors.full_messages}
    end
  end

  def destroy
    if @status.destroy
      render json: {:Result => "OK"}
    else
      render json:{:Result => "ERROR", :Message => @status.errors.full_messages}
    end
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_status
    @status = Status.find(params[:id])
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
