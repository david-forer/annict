# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def new
    @new_user = User.new_with_session({}, session)
  end

  def create
    @new_user = User.new(user_params).build_relations
    @new_user.time_zone = cookies["ann_time_zone"].presence || "Asia/Tokyo"
    @new_user.locale = locale

    return render(:new) unless @new_user.valid?

    @new_user.setting.privacy_policy_agreed = true
    @new_user.save!
    ga_client.user = @new_user
    ga_client.events.create(:users, :create, el: "via_web")

    flash[:notice] = t("messages.registrations.create.confirmation_mail_has_sent")
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :terms_and_privacy_policy_agreement)
  end
end
