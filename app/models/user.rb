class User < ApplicationRecord
  has_many :posts
  has_many :audit_logs
  # rails convention to have associations and be explicit about the class name
  # provides one way access to support knowing which managers have which employees
  has_many :hands_associations, class_name: Hand
  has_many :hands, through: :hands_associations


  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :phone, :ssn, :company

  # despite valid syntax, use of ^ and $ create a security risk in Rails; Rails provides special helpers to substitute
  # PHONE_REGEX = /^[0-9]*/
  PHONE_REGEX = /\A[0-9]*\Z/

  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: { is: 10 }
  validates :ssn, length: { is: 4 }
  validates_numericality_of :ssn

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
