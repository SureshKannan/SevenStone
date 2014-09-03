class TicketHistoryController < ApplicationController
  # before_action :set_history, only: [:index]
  def index
    historyCount = 2
    @histories = TicketHistory.all
    render json:{:Result => "OK", :Records => @histories, :TotalRecordCount => historyCount}
  end
  def list
    
  end
  private
  def set_history
    @histories = TicketHistory.find_by ticket_id: params[:id]
  end
end
