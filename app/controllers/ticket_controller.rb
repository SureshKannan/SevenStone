class TicketController < ApplicationController
  before_action :set_ticket, only: [:update, :destroy]
  before_action :bind_model, only: [:update]
 def list
   
 end
  def index
    
     queryString = search
    
    #logger.debug "**Record date #{params[:recordDate]}  *************"
   
    if queryString.empty?
      @pageTicket = Ticket.pageTicket(params['jtPageSize'],params['jtStartIndex'],params['jtSorting'])
      totalTickets = Ticket.count
    else
      queryString = "select * from departments " + queryString
      totalTickets = Ticket.find_by_sql(queryString).count
      queryString += " limit " + params['jtStartIndex'] + " ," + params['jtPageSize']
      @pageTicket = Ticket.find_by_sql(queryString)
    end
    #@tickets = Ticket.all
    #totalTicket = @tickets.count
    render json:{:Result => "OK", :Records => @pageTicket, :TotalRecordCount => totalTickets}
  end

  def create
    @ticket = Ticket.new
     bind_model
    if @ticket.save
      
     
      render json:{:Result => "OK", :Record => @ticket}
    else
      render json:{:Result => "ERROR", :Message => @ticket.errors.full_messages}
    end
  end

  def update
    #bind_model
    if @ticket.save
      render json:{:Result => "OK", :Record => @ticket}
    else
      render json:{:Result => "ERROR", :Message => @ticket.errors.full_messages}
    end
  end

  def destroy
    if @ticket.destroy
      
      render json: {:Result => "OK"}
    else
      render json:{:Result => "ERROR", :Message => @ticket.errors.full_messages}
    end
  end
  
  def departmentOption
   roleHash = jtableOption(Department)  
    
    render json:{:Result => "OK", :Options => roleHash}
  end
   def catagoryOption
   roleHash = jtableOption(Category)  
    
    render json:{:Result => "OK", :Options => roleHash}
  end
   def applicationOption
   roleHash = jtableOption(EnterpriseApplication)  
    
    render json:{:Result => "OK", :Options => roleHash}
  end
   def priorityOption
   roleHash = jtableOption(Priority)  
    
    render json:{:Result => "OK", :Options => roleHash}
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
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
 
  def bind_model
    @ticket.category_id= params['category_id']
    @ticket.department_id= params['department_id']
    @ticket.priority_id= params['priority_id']
    @ticket.status_id= params['status_id']
    @ticket.application_id= params['application_id']
  end
#   
  # def getDepartment
    # @department_ids = Deaprtment.all
    # render json:{:Result => "OK", :Records => @department_ids}
  # end
end
