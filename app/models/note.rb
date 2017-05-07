class Note < ApplicationRecord
  belongs_to :user
  has_many :note_contents, inverse_of: :note
  accepts_nested_attributes_for :note_contents
  validates :user_id, presence: true
end
