class User < ActiveRecord::Base
  has_many :reservations, -> { where(date: Date.current).order('time asc') }
  validates :name, presence: true
  validates :email, presence: true
  before_save :downcase_email
  has_secure_password

  def downcase_email
    self.email = email.downcase
  end
end
