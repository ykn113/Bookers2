class Book < ApplicationRecord
  
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true, length:{maximum: 200}
  validates :rate, presence: true, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }
  validates :category, presence: true
  
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  has_many :book_comments, dependent: :destroy
  
  def self.search(search, word)
    if search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "perfect_match"
      @book = Book.where(title: "#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
  
  def self.book_search(search_word)
    Book.where(['category LIKE ?', "%#{search_word}%"])
  end
  
end
