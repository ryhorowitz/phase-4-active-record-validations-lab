class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :title_is_clickbaity

  def title_is_clickbaity
    clickbait = [/Won't Believe/i, /Secret/i, /Top \d+/i, /Guess/i]
    if clickbait.none? { |regex| regex.match title }
      errors.add(:title, "Sorry")
    end
    # regex = /(?:(Won't Believe)|(Secret)|(Top \d+)|(Guess))/
  end
end
