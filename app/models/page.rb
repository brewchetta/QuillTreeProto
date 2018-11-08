class Page < ActiveRecord::Base
  belongs_to :story

  validates :content, presence: true
  validate :background_url_good

private

  def background_url_good
    unless FastImage.size("#{background}")
      errors.add(:background,' must be a valid url!')
    end
    if FastImage.size("#{background}")
      if FastImage.size("#{background}")[0] > 2000
        errors.add(:background,' cannot be more than 2000px wide')
      end
    end
  end

end
