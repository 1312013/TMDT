
class Admin < ApplicationRecord
  
	validates :name, presence: true
	validates :password, presence: true
	
	validates :password, length: { in: 6..20 }

  validates :name, uniqueness: true

	has_secure_password

  
end
