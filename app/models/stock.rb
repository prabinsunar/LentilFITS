class Stock < ApplicationRecord
  belongs_to :item
  belongs_to :donator
  belongs_to :site
  belongs_to :category
  belongs_to :size
  has_many :transfers
  has_many :consumptions

  validates :name, presence: true
  validates :category_id, presence: true
  validates :size_id, presence: true
  validates :site_id, presence: true
end
