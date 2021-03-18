# == Schema Information
#
# Table name: users
#
#  id                                  :bigint           not null, primary key
#  access_count_to_reset_password_page :integer          default(0)
#  admin                               :boolean
#  crypted_password                    :text
#  driver                              :boolean
#  email                               :text             not null
#  failed_logins_count                 :integer          default(0)
#  last_activity_at                    :datetime
#  last_login_at                       :datetime
#  last_login_from_ip_address          :text
#  last_logout_at                      :datetime
#  lock_expires_at                     :datetime
#  manager                             :boolean
#  name                                :text
#  phone                               :text
#  reset_password_email_sent_at        :datetime
#  reset_password_token                :text
#  reset_password_token_expires_at     :datetime
#  salt                                :text
#  unlock_token                        :text
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_users_on_email                                (email) UNIQUE
#  index_users_on_last_logout_at_and_last_activity_at  (last_logout_at,last_activity_at)
#  index_users_on_reset_password_token                 (reset_password_token)
#  index_users_on_unlock_token                         (unlock_token)
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :orders
  has_many :invoices

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  def self.get_current_users
    config = sorcery_config

    where("#{config.last_activity_at_attribute_name} IS NOT NULL") \
    .where("#{config.last_logout_at_attribute_name} IS NULL
    OR #{config.last_activity_at_attribute_name} > #{config.last_logout_at_attribute_name}") \
    .where("#{config.last_activity_at_attribute_name} > ? ", config.activity_timeout.seconds.ago.utc.to_s(:db))
  end

  def manager_or_admin?
    manager? or admin?
  end

  def driver_or_manager_or_admin?
    driver? or manager? or admin?
  end
end
