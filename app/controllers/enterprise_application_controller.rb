class EnterpriseApplicationController < ApplicationController
   before_action :set_enterpriseApplication, only: [:update, :destroy]
 def list
   
 end
  def index
    
     queryString = search
    
    #logger.debug "**Record date #{params[:recordDate]}  *************"
   
    if queryString.empty?
      @pageEnterpriseApplication = EnterpriseApplication.pageEnterpriseApplication(params['jtPageSize'],params['jtStartIndex'],params['jtSorting'])
      totalEnterpriseApplications = EnterpriseApplication.count
    else
      queryString = "select * from departments " + queryString
      totalEnterpriseApplications = EnterpriseApplication.find_by_sql(queryString).count
      queryString += " limit " + params['jtStartIndex'] + " ," + params['jtPageSize']
      @pageEnterpriseApplication = EnterpriseApplication.find_by_sql(queryString)
    end
    
    render json:{:Result => "OK", :Records => @pageEnterpriseApplication, :TotalRecordCount => totalEnterpriseApplications}
  end

  def create
    @enterpriseApplication = EnterpriseApplication.new
    @enterpriseApplication.name= params['name']
    if @enterpriseApplication.save
      render json:{:Result => "OK", :Record => @enterpriseApplication}
    else
      render json:{:Result => "ERROR", :Message => @enterpriseApplication.errors.full_messages}
    end
  end

  def update
    @enterpriseApplication.name = params[:name]
    if @enterpriseApplication.save
      render json:{:Result => "OK", :Record => @enterpriseApplication}
    else
      render json:{:Result => "ERROR", :Message => @enterpriseApplication.errors.full_messages}
    end
  end

  def destroy
    if @enterpriseApplication.destroy
      render json: {:Result => "OK"}
    else
      render json:{:Result => "ERROR", :Message => @enterpriseApplication.errors.full_messages}
    end
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_enterpriseApplication
    @enterpriseApplication = EnterpriseApplication.find(params[:id])
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
