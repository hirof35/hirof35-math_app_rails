class StudyRecord < ApplicationRecord
  belongs_to :user
  belongs_to :drill
end
