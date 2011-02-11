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
      format.js { render :layout => false }
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(:task => params[:todo][:task], :todo_type => params[:todo][:todo_type])

    respond_to do |format|
      if @todo.save
        @todo.add_unfinished_users(current_user, @account.friend(current_user))
        @account.todos << @todo
        UserMailer.new_todo(@account.friend(current_user), current_user, @account).deliver
        Event.create!(:event_type => :new_todo, :user => current_user, :account => @account)
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

  def complete
    @todo = Todo.find(params[:id])
    email = UserMailer.completed_todo(@account.friend(current_user), current_user, @todo)
    @todo.check_off(current_user)
    if @todo.done?
      email.deliver
    end 

    respond_to do |format|
      format.html { redirect_to(@account) }
    end
  end

  private 

  
end
