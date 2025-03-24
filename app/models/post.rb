def set_longitude
  self.longitude = 0 if self.longitude.blank?
end

def set_lattitude
  self.lattitude = 0 if self.lattitude.blank?
end

def set_posttime
  self.posttime = DateTime.now if self.posttime.blank?
end

class Post < ApplicationRecord
  has_one_attached :photo
  before_save :set_longitude
  before_save :set_lattitude
  before_save :set_posttime


end
