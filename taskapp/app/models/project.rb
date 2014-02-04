class Project < ActiveRecord::Base
  has_many :tasks
  validates :title, presence: { message: "nyuuryoku sitekudasai"}, length: { minimum: 3, message: "mijikai."}
end
