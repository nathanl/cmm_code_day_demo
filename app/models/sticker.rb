class Sticker < ActiveRecord::Base

  validates :color, :text, presence: true

end
