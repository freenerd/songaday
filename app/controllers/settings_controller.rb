class SettingsController < ApplicationController
  before_filter :authenticate_user!

  # GET /settings/1/edit
  def edit
    @user = current_user
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @user.update(setting_params)
        format.html { redirect_to songs_url, notice: 'Setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      puts params
      params.require(:user).permit(:phone, :other_phone, :other_email)
    end
end
