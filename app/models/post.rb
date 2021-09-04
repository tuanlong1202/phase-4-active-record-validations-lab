class Post < ApplicationRecord
    
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: ['Fiction', 'Non-Fiction']
    
    validate :clickbait

    def clickbait
        if !(title.to_s.include?("Won't Believe") || title.to_s.include?("Secret") || title.to_s.include?("Top [number]") || title.to_s.include?("Guess"))
            errors.add(:title, "The title must follow the rule!")
        end
    end

end
