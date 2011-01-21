class ItemsController < ApplicationController
 
  before_filter :get_list 

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        @list.items << @item
        format.html { redirect_to(@list.account, :notice => 'Item was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to(@list.account, :notice => 'Item was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(@list.account) }
    end
  end
  
  private

  def get_list
    @list = List.find(params[:list_id])
  end
end

