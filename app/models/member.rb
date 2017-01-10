class Member < ApplicationRecord
	has_many :bai_posts, dependent: :destroy
	has_many :hoa_dons, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :reviews, dependent: :destroy

  has_many :primary_member, :class_name => "Member", :foreign_key => "nguoiban_id"
  has_many :secondary_member, :class_name => "Member", :foreign_key => "nguoimua_id"
  has_many :thong_baos, dependent: :destroy
  has_many :dia_chis, dependent: :destroy
  has_many :thoi_gian_phuc_vus, dependent: :destroy
  has_many :primary_member, :class_name => "Member", :foreign_key => "nguoinhan_id"
  has_many :secondary_member, :class_name => "Member", :foreign_key => "nguoigui_id"


	def self.login_from_omniauth(auth)
    find_by(LoaiMXH: auth['provider'], uid: auth['uid']) ||
            create_member_from_omniauth(auth)
  	end

  def self.create_member_from_omniauth(auth)
    create(
      LoaiMXH: auth['provider'],
      uid: auth['uid'],
      HoTen: auth['info']['name'],
      Email: auth['info']['email'])
	end

end
