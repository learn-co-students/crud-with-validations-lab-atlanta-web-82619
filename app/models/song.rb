class Song < ApplicationRecord

    validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
    validates :artist_name, presence: true
    validates :released, inclusion: {in: [true, false]}   
    validates :release_year, presence: true, if: :released?
    validate :release_date_valid
      
    def released?
        released == true
    end

    def release_date_valid
      release_year.present? && release_year <= Date.today.year
        # errors.add(:release_year, "can't be in the future")
    end
end



# title, a string must not be blank
# title cannot be repeated by the same artist in the same year
# release_year, an integer (optional if released is false)
# release_year must not be blank if released is true
# release_year must be less than or equal to the current year
# artist_name, a string, must not be blank
# genre, a string


