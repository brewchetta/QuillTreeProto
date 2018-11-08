class Story < ActiveRecord::Base
  has_many :pages
  belongs_to :user
  validates :title, presence: true
  validates :title, uniqueness: true
  validate :max_synopsis_size

  def max_synopsis_size
    if synopsis.length > 300
      errors.add(:synopsis,' must be less than 300 characters long!')
    end
  end

end
