 class TodosController < ApplicationController

  before_filter :set_todo, only: [:edit, :update, :show, :destroy]
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
  end

  def update
    if @todo.update_attributes(params[:todo])
       flash[:notice]= "Todo was successfully updated"
       redirect_to todos_path(@todo)
    else
      render 'edit'
    end

  end

  def index
    @todos=Todo.all
  end

  def destroy
    @todo.destroy
    flash[:notice]= "todo deleted successfully"
    redirect_to todos_path
  end

  def show

  end

  private
     def set_todo
      @todo = Todo.find(params[:id])
     end

end
