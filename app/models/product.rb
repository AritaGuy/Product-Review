class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
      Reviews.create(user_id:user.id, star_rating:star_rating, comment:comment, product_id:product.id)
    end

    def print_all_reviews
        self.reviews.collect do |product|
            "Review for #{self.name} by #{product.user.name}:#{product.star_rating}. #{product.comment}" 
        end
    end

    def average_rating
      arr = self.reviews.collect do |product|
         product.star_rating
        end
       arr.sum/arr.size
    end
end