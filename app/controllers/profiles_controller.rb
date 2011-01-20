class ProfilesController < ApplicationController

  def show
    respond_to do |format|
      format.html { redirect_to edit_profile_path }
      format.xml  { render :xml => @profile }
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(home_path, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end
end
