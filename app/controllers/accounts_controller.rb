class AccountsController < ApplicationController

  def index
    @accounts = current_user.accounts

    respond_to do |format|
      format.html
    end
  end

  def show
    @account = Account.find(params[:id])
 
    if @account.users.length < 2
      redirect_to :root, :notice => "Sorry, That Harmony is not Complete, Yet."
    else
      @events = @account.events.order('created_at desc')
      @lists = @account.lists

      @mine = my_unfinished_todos
      @theirs = their_unfinished_todos
      @finished = our_finished_todos

      @notes = @account.notes 
      @friend = @account.friend(current_user)
      respond_to do |format|
        format.html 
      end
    end
  end

  def join 
    @account = Account.find(params[:id])
    @invite = @account.invites.first
    @email = current_user.email 
    if @invite.email == @email
      @account.users << current_user 
      @invite.destroy
      @account.invites == []
      UserMailer.join(@account.friend(current_user), @account).deliver
    end 
    redirect_to @account
  end

  def new
    @account = Account.new

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(params[:account])
    @account.name = params[:name] if params[:name]
    @email = params[:email]

    respond_to do |format|
      if @account.save && @email.present?
        @account.users << current_user
        @account.invites << Invite.new(:email => @email)
        UserMailer.invite(@email, current_user, @account).deliver
        format.html { redirect_to(:home, :notice => 'Harmony was created, you can access once the other person accepts.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to(@account, :notice => 'Account was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(:home) }
      format.xml  { head :ok }
    end
  end

  private

  def my_unfinished_todos
    return @account.todos.unfinished.for_user(current_user) 
  end

  def their_unfinished_todos
    return @account.todos.unfinished #- my_unfinished_todos
  end

  def our_finished_todos
    return @account.todos.finished
  end

end
