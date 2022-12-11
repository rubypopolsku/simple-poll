class Vote < ApplicationRecord
  belongs_to :poll_answer
  belongs_to :poll
end
