class CatRentalRequest < ApplicationRecord
    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: { in: ['PENDING', 'APPROVED', 'DENIED']}
    validate :does_not_overlap_approved_request

    belongs_to :cat,
        class_name: 'Cat',
        foreign_key: :cat_id

    def overlapping_requests
        
        CatRentalRequest  
            .where.not("start_date > '#{self.end_date}' OR
                end_date < '#{self.start_date}'")
            .where("cat_id = #{self.cat_id}")
            .where("status != 'DENIED'")
    end

    def overlapping_approved_requests
        overlapping_requests.where("status = 'APPROVED'")
    end

    def does_not_overlap_approved_request
        if overlapping_approved_requests.exists?
            errors.add(:start_date, "date overlaps with previously approved request")
            errors.add(:end_date, "date overlaps with previously approved request")
        end

    end
end





