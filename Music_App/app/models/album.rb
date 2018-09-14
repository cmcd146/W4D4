class Album < ApplicationRecord
  validates :title, :year, :band_id, :live, presence: true
  validates :live, inclusion: {in: [true, false] }
  after_initialize :translate_live_string


  def translate_live_string
      self.live ||= false
  end
end
