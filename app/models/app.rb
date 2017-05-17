class App < ActiveRecord::Base
  belongs_to :admin

  validates :subdomain, :admin_id, :intercom_id, presence: true
  validates :subdomain, uniqueness: true
  validates :subdomain, :intercom_id, format: { with: /\A[a-zA-Z0-9]*\z/, message: ": only letters and/or numbers are allowed"}
  validates :subdomain, length: {maximum: 20, too_long: ": %{count} characters is the maximum allowed"}
  validates :subdomain, format: { with: /\A[a-z0-9]+\z/ }
  validates :intercom_id, length: {maximum: 50, too_long: ": %{count} characters is the maximum allowed"}
end
