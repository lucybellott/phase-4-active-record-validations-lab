class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    
    # validate :clickbait

    
  def clickbait
    clickbait_examples = [ "Won't Believe","Secret","Top","Guess" ]
   clickbait = clickbait_examples.any? {|word| word.match title}
   if !clickbait
    errors.add(:title, "it's not clickbait")
   end
  end


end
