class User < ActiveRecord::Base
  acts_as_tenant(:app)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates_uniqueness_to_tenant :email
  validates_presence_of   :email, if: :email_required?

  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?

  def self.find_for_authentication(warden_conditions)
    where(:email => warden_conditions[:email], :subdomain => warden_conditions[:subdomain]).first
  end

  protected
    # Checks whether a password is needed or not. For validations only.
    # Passwords are always required if it's a new record, or if the password
    # or confirmation are being set somewhere.
    def password_required?
      !persisted? || !password.nil? || !password_confirmation.nil?
    end

    def email_required?
      true
    end
end
