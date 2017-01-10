class LoaiMonAn < ApplicationRecord
	has_many :bai_post_loai_mon_ans, dependent: :destroy
end
