class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    def self.fanciest
        Restaurant.all.order(:price).last
    end

    def all_reviews
        self.reviews.all.map { |review| "Review for #{self.name} by #{review.customer.full_name}: #{review.star_rating} stars." }
    end
end