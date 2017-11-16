class CustomDataAttribute < ApplicationRecord
  belongs_to :app
  validates :name, uniqueness: true

  def valid_timestamp?
end
