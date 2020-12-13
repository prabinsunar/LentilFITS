class Transfer < ApplicationRecord
  belongs_to :stock
  belongs_to :site

  validates :quantity, presence: true
  validates :expire_at, presence: true
  validates :stock_id, presence: true
  validates :site_id, presence: true

  def self.active?
    Transfer.where(status: true)
  end

  def self.inactive?
    Transfer.where(status: false)
  end

  def self.expired?
    Transfer.where("expire_at < ?", Date.today).where(status: true)
  end

  # def self.renew id
  #   @transfer = Transfer.where(id: id)
  #   @transfer.update(expire_at: 7.days.from_now)
  # end

  def self.receive id
    @transfer = Transfer.where(id: id)
    @transfer.update(status: false)
  end
end
