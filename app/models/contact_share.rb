class ContactShare < ActiveRecord::Base
  belongs_to(:contact)
  belongs_to(:user)
  has_many(:comments)
  
  validates :contact_id, :user_id, :presence => true, uniqueness: true
end
