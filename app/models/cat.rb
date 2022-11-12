class Cat < ApplicationRecord

    CAT_COLORS = [
        "Black",
        "White",
        "Brown",
        "Ginger",
        "Mixed"
    ]

    GENDER = [
        "F",
        "M"
    ]

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: {in: CAT_COLORS}
    validates :sex, inclusion: {in: GENDER}
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        today = Date.today
        if birth_date > today
            errors.add(:birth_date,"Cannot be in the future")
        end
    end

    def age
        today = Date.today
        today.year - birth_date.year
    end

    has_many :rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

end
