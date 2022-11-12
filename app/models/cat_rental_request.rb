class CatRentalRequest < ApplicationRecord

    STATUS = [
        "APPROVED",
        "PENDING",
        "DENIED"
    ]

    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: {in: STATUS}
    validate :does_not_overlap_approved_request

    def overlapping_requests
        CatRentalRequest.where("cat_id = ?",:cat_id).where("? < end_date",:start_date)
    end

    def overlapping_approved_requests
        overlapping_approved_requests.where("status = 'APPROVED'")
    end

    def does_not_overlap_approved_request
        overlapping_approved_requests.exists?#(self)
    end

    belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

end
