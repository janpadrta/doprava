# == Schema Information
#
# Table name: users
#
#  id                                  :integer          not null, primary key
#  access_count_to_reset_password_page :integer          default(0)
#  admin                               :boolean
#  crypted_password                    :string
#  driver                              :boolean
#  email                               :string           not null
#  failed_logins_count                 :integer          default(0)
#  last_activity_at                    :datetime
#  last_login_at                       :datetime
#  last_login_from_ip_address          :string
#  last_logout_at                      :datetime
#  lock_expires_at                     :datetime
#  manager                             :boolean
#  name                                :string
#  phone                               :string
#  reset_password_email_sent_at        :datetime
#  reset_password_token                :string
#  reset_password_token_expires_at     :datetime
#  salt                                :string
#  unlock_token                        :string
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
end
