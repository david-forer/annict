# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :load_i18n, only: %i(show)

  def show
    @person = Person.without_deleted.find(params[:id])

    if @person.voice_actor?
      @casts_with_year = @person.
        casts.
        without_deleted.
        joins(:work).
        where(works: { deleted_at: nil }).
        includes(:character, work: :work_image).
        group_by { |cast| cast.work.season_year.presence || 0 }
      @cast_years = @casts_with_year.keys.sort.reverse
    end

    if @person.staff?
      @staffs_with_year = @person.
        staffs.
        without_deleted.
        joins(:work).
        where(works: { deleted_at: nil }).
        includes(work: :work_image).
        group_by { |staff| staff.work.season_year.presence || 0 }
      @staff_years = @staffs_with_year.keys.sort.reverse
    end

    @favorite_people = @person.
      favorite_people.
      includes(user: :profile).
      joins(:user).
      merge(User.without_deleted).
      order(id: :desc)
  end

  private

  def load_i18n
    keys = {
      "messages._components.favorite_button.add_to_favorites": nil,
      "messages._components.favorite_button.added_to_favorites": nil
    }

    load_i18n_into_gon keys
  end
end
