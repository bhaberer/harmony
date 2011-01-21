class TodosController < ApplicationController

  before_filter :get_account
  before_filter :auth_check

  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @todo = Todo.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(params[:todo])
    
    respond_to do |format|
      if @todo.save
        @account.todos << @todo
        current_user.todos << @todo
        UserMailer.new_todo(@account.friend(current_user), current_user, @account).deliver
        format.html { redirect_to(@account, :notice => 'Todo was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to(@account, :notice => 'Todo was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to(@account) }
    end
  end
 
end
