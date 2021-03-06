# frozen_string_literal: true

module Db
  class ApplicationController < ActionController::Base
    include Pundit

    include ControllerCommon
    include Localable
    include FlashMessage
    include Analyzable
    include LogrageSetting
    include Gonable
    include RavenContext
    include PageCategoryMethods

    layout "db"

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    helper_method :gon, :locale_ja?, :locale_en?, :local_url

    around_action :switch_locale
    before_action :redirect_if_unexpected_subdomain
    before_action :set_search_params
    before_action :store_data_into_gon
    before_action :store_page_category

    private

    def set_search_params
      @search = SearchService.new(params[:q], scope: :all)
    end

    def user_not_authorized
      flash[:alert] = t "messages._common.you_can_not_access_there"
      redirect_to(request.referrer || db_root_path)
    end
  end
end
