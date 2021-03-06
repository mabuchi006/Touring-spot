class Spot < ApplicationRecord
  attachment :image
  belongs_to :genre, class_name: 'Genre', foreign_key: 'genre_id'

  validates :name, presence: true
  validates :introduction, presence: true
  has_many :spot_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  # validates :price, presence: true
  # validates :is_active, presence: true

  # def add_tax_price
  #  (self.price / 1.08).round
  # end

  def self.search_for_for(content, method)
    if method == "perfect"
      where(name: content)
    else
      where("name LIKE ?", "%" + content + "%")
    end
  end
end
