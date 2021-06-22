class DogOwner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dogs, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :cognitions, dependent: :destroy
  has_many :references, dependent: :destroy

  attachment :image

  validates :email, presence: true
  validates :encrypted_password, presence: true, uniqueness: true
  validates :encrypted_password, length: { minimum: 6 }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :nickname, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

end
