class Plan < ApplicationRecord
  STAGES = ["Existing", "Build", "Interior"].freeze

  belongs_to :floor
  has_many :dots
end
