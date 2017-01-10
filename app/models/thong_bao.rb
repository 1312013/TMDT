class ThongBao < ApplicationRecord
	belongs_to :NguoiNhan, :class_name => 'Member', :foreign_key => 'nguoinhan_id'
  	belongs_to :NguoiGui, :class_name => 'Member', :foreign_key => 'nguoigui_id'
end
