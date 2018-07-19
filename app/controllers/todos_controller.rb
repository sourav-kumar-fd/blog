class TodosController < ApplicationController

  def new
  	@todo=Todo.new
  end 



  def create
  	@todo = Todo.new(params[:todo])
  	if @todo.save
  		flash[:notice] = "Todo was created successfully"
  	    redirect_to todo_path(@todo)
    else
  	    render 'new'
  	end
  end

  def edit
   @todo = Todo.find(params[:id]) 
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(params[:todo])
       flash[:notice]= "Todo was successfully updated"
       redirect_to todo_path(@todo)
    else
      render 'edit'
    end

  end

  def index
    @todos=Todo.all
  end

  def show
  	 @todo=Todo.find(params[:id])
  end

end