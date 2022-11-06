class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        # self.reviews.collect do |t|
        #     t.star_rating
        # end.max()
        self.reviews.order(:star_rating).last
    end

    def remove_reviews(product)
        # Review.destroy(products.name == product)
        self.reviews.where(product: product).destroy_all
    end
end