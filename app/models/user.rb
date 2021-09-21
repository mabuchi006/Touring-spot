class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :bike_spots, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :postcode, presence: true, format: { with: /\A\d{7}\z/ } # 郵便番号ハイフンなし7桁
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ } # 電話番号ハイフンなし10・11桁

  # def active_for_authentication?
  # super && (self.is_deleted == false)
  # end

  def full_name
    last_name + first_name
  end

  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end

  scope :full_name, -> { last_name + first_name }
end
