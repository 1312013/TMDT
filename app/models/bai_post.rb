class BaiPost < ApplicationRecord
  # attr_accessible :foodimage
  #belongs_to :member
  has_many :hoa_dons, dependent: :destroy
  has_many :reviews, dependent: :destroy
  mount_uploader :foodimage, FoodimageUploader 
  has_many :bai_post_loai_mon_ans, dependent: :destroy

end
