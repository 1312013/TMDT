class HoaDon < ApplicationRecord
	belongs_to :member
	belongs_to :bai_post
	has_many :chi_tiet_hoa_dons, dependent: :destroy
	belongs_to :NguoiBan, :class_name => 'Member', :foreign_key => 'nguoiban_id'
  	belongs_to :NguoiMua, :class_name => 'Member', :foreign_key => 'nguoimua_id'
  	belongs_to :lich_giao_hang
	has_many :chi_tiet_giao_hang

end
