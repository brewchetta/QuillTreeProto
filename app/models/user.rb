class User < ActiveRecord::Base
  has_many :stories
  validates :name, presence: true
  validates :name, uniqueness: true
  validate :max_bio_size

  def max_bio_size
      if bio.length > 300
        errors.add(:bio,' must be less than 300 characters long!')
      end
  end

end
