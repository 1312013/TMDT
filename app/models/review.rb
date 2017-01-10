class Review < ApplicationRecord
  belongs_to :bai_post
  belongs_to :member
end
