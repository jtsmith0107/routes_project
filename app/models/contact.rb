class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, :uniqueness => { :scope => :user_id }
  
  belongs_to :user
  
  has_many :contact_shares
  has_many :shared_users, through: :contact_shares, source: :user
  has_many :comments, as: :commentable
  
  def self.contacts_for_user_id(user_id)
    # Contact.joins("LEFT OUTER JOIN contact_shares
    #  ON contact_shares.contact_id = contacts.id").where()
    #
    Contact.joins("LEFT OUTER JOIN contact_shares\
                      ON contact_shares.contact_id = contacts.id")
                .select('contacts.*')
                .where('(contact_shares.user_id = ? OR contacts.user_id = ?)', user_id, user_id)
  end
end
