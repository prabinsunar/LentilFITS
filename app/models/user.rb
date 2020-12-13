class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :site
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
end
