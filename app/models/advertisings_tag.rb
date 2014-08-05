class AdvertisingsTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :advertising
end