class NotesController < ApplicationController
 
  before_filter :get_account
  before_filter :auth_check 

  def index
    @notes = @account.notes
  
    respond_to do |format|
      format.html
    end
  end

  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @note = Note.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(params[:note])
    @note.account = @account
    @note.user = current_user

    respond_to do |format|
      if @note.save
        format.html { redirect_to(@account, :notice => 'Note was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to(@account, :notice => 'Note was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(@account) }
    end
  end
 
end
