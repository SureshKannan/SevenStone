class TicketHistoryController < ApplicationController
   before_action :set_history, only: [:index]
  def index
    historyCount = @histories.count
    #@histories = TicketHistory.all
    render json:{:Result => "OK", :Records => @histories, :TotalRecordCount => historyCount}
  end
  def list
    
  end
  private
  def set_history
      logger.debug "**Ticket #{params[:id]}  *************"
    @histories = TicketHistory.where(:ticket_id => params[:id])
    
  end
end
