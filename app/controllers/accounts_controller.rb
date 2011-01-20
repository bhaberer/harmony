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
      @notes = @account.notes 
      users = @account.users
      users[0] == current_user ? @friend = users[1] : @friend = users[0] 
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
    end 
    redirect_to @account

  end

  def new
    @account = Account.new
    @code = params[:code]

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(params[:account])
    @email = params[:email]

    respond_to do |format|
      if @account.save && @email.present?
        @account.users << current_user
        @account.invites << Invite.new(:code => ActiveSupport::SecureRandom.base64(12), :email => @email)
        UserMailer.invite(@email, current_user).deliver
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
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
end
