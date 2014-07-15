class CategoryController < ApplicationController
  before_action :set_category, only: [:update, :destroy]
 def list
   
 end
  def index
    
     queryString = search
    
    #logger.debug "**Record date #{params[:recordDate]}  *************"
   
    if queryString.empty?
      @pageCategory = Category.pageCategory(params['jtPageSize'],params['jtStartIndex'],params['jtSorting'])
      totalCategories = Category.count
    else
      queryString = "select * from departments " + queryString
      totalCategories = Category.find_by_sql(queryString).count
      queryString += " limit " + params['jtStartIndex'] + " ," + params['jtPageSize']
      @pageCategory = Category.find_by_sql(queryString)
    end
    #@categories = Category.all
    #totalCategory = @categories.count
    render json:{:Result => "OK", :Records => @pageCategory, :TotalRecordCount => totalCategories}
  end

  def create
    @category = Category.new
    @category.name= params['name']
    if @category.save
      render json:{:Result => "OK", :Record => @category}
    else
      render json:{:Result => "ERROR", :Message => @category.errors.full_messages}
    end
  end

  def update
    @category.name = params[:name]
    if @category.save
      render json:{:Result => "OK", :Record => @category}
    else
      render json:{:Result => "ERROR", :Message => @category.errors.full_messages}
    end
  end

  def destroy
    if @category.destroy
      render json: {:Result => "OK"}
    else
      render json:{:Result => "ERROR", :Message => @category.errors.full_messages}
    end
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
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
