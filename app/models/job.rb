class Job < ApplicationRecord
	belongs_to :headhunter
	enum status: [:active, :inactive]
	has_many :applies, as: :applicable
end
