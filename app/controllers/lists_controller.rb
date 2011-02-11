class ListsController < ApplicationController

  before_filter :get_account
  before_filter :auth_check

  def show
    respond_to do |format|
      format.html { redirect_to @account }
    end
  end

  def new
    @list = List.new

    respond_to do |format|
      format.html # new.html.erb
      format.js { render :layout => false }
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params[:list])

    respond_to do |format|
      if @list.save
        @account.lists << @list
        UserMailer.new_list(@account.friend(current_user), current_user, @account).deliver
        Event.create!(:event_type => :new_list, :user => current_user, :account => @account)
        format.html { redirect_to(@account, :notice => 'List was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to(@account, :notice => 'List was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(@account) }
    end
  end
end
