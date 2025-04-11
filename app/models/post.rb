require 'exifr/jpeg'
require 'time'



def set_longitude
  self.longitude = 0 if self.longitude.blank?
end

def set_latitude
  self.latitude = 0 if self.latitude.blank?
end

def set_posttime
  self.posttime = DateTime.now if self.posttime.blank?
end

class Post < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :comments, dependent: :destroy



  after_commit :extract_gps_from_image, on: [:create, :update], if: -> { photo.attached? && (latitude.blank? || longitude.blank?) }

  private

  def extract_gps_from_image
    photo.open(tmpdir: Dir.tmpdir) do |file|
      exif = EXIFR::JPEG.new(file.path)

      if exif&.gps
        update_columns(
          latitude: exif.gps.latitude,
          longitude: exif.gps.longitude
        )
      end

      if exif&.date_time
        update_columns(photodate: exif.date_time.to_datetime)  # Ensure DateTime format
      end
    end
  end

  before_save :set_posttime
end
