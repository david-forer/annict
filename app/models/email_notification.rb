# frozen_string_literal: true
# == Schema Information
#
# Table name: email_notifications
#
#  id                         :integer          not null, primary key
#  event_favorite_works_added :boolean          default(TRUE), not null
#  event_followed_user        :boolean          default(TRUE), not null
#  event_friends_joined       :boolean          default(TRUE), not null
#  event_liked_episode_record :boolean          default(TRUE), not null
#  event_next_season_came     :boolean          default(TRUE), not null
#  event_related_works_added  :boolean          default(TRUE), not null
#  unsubscription_key         :string           not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  user_id                    :integer          not null
#
# Indexes
#
#  index_email_notifications_on_unsubscription_key  (unsubscription_key) UNIQUE
#  index_email_notifications_on_user_id             (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class EmailNotification < ApplicationRecord
end
