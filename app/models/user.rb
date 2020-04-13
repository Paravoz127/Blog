class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  mount_uploader :avatar, AvatarUploader

  validates :full_name, presence: true

  has_and_belongs_to_many :companies, foreign_key: "author_id", inverse_of: :authors
  has_one :own_company, class_name: "Company", foreign_key: "owner_id", inverse_of: :owner
  has_many :articles

  accepts_nested_attributes_for :own_company, :companies
end
