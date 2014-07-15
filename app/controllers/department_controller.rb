class DepartmentController < ApplicationController
  before_action :set_department, only: [:update, :destroy]
 def list
   
 end
  def index
    
     queryString = search
    
    #logger.debug "**Record date #{params[:recordDate]}  *************"
   
    if queryString.empty?
      @pageDepartment = Department.pageDepartment(params['jtPageSize'],params['jtStartIndex'],params['jtSorting'])
      totalDepartments = Department.count
    else
      queryString = "select * from departments " + queryString
      totalDepartments = Department.find_by_sql(queryString).count
      queryString += " limit " + params['jtStartIndex'] + " ," + params['jtPageSize']
      @pageDepartment = Department.find_by_sql(queryString)
    end
    #@departments = Department.all
    #totalDepartment = @departments.count
    render json:{:Result => "OK", :Records => @pageDepartment, :TotalRecordCount => totalDepartments}
  end

  def create
    @department = Department.new
    @department.name= params['name']
    if @department.save
      render json:{:Result => "OK", :Record => @department}
    else
      render json:{:Result => "ERROR", :Message => @department.errors.full_messages}
    end
  end

  def update
    @department.name = params[:name]
    if @department.save
      render json:{:Result => "OK", :Record => @department}
    else
      render json:{:Result => "ERROR", :Message => @department.errors.full_messages}
    end
  end

  def destroy
    if @department.destroy
      render json: {:Result => "OK"}
    else
      render json:{:Result => "ERROR", :Message => @department.errors.full_messages}
    end
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_department
    @department = Department.find(params[:id])
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
