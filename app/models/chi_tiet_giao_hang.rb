class ChiTietGiaoHang < ApplicationRecord
	belongs_to :xe
	belongs_to :hoa_don
	belongs_to :buoi_trong_ngay
end
