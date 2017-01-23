class Post < ApplicationRecord
  # enum allows you to dynamically create methods created based on the contents of the object
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :rationale
end
