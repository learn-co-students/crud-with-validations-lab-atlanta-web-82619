class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates  :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validate :release_date_cannot_be_in_the_future
    
 
  def release_date_cannot_be_in_the_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:expiration_year, "can't be in the future")
    end
  end
end
