class Reservation < ApplicationRecord
    validates :check_in_at, presence: true
    validates :check_out_at, presence: true
    validates :people_count, numericality: { only_integer: true, greater_than: 0 }
    validate :check_in_must_be_equal_or_after_today
    validate :check_out_must_be_after_check_in
    
    belongs_to :user

    def check_in_date
        check_in_at.to_date
    end
    
    def check_out_date
        check_out_at.to_date
    end

    def check_in_must_be_equal_or_after_today 
        return if check_in_at.to_date >= Time.current.to_date
        errors.add(:check_in_at, "は本日以降の日付で入力してください")
    end

    def check_out_must_be_after_check_in 
        return if check_out_at.to_date > check_int_at.to_date
        errors.add(:check_out_at, "はチェックインより後の日付を入力してください")
    end
end
