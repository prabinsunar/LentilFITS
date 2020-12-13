class Site < ApplicationRecord
  has_one :user
  has_many :stocks
  has_many :transfers
  has_many :consumptions

  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
