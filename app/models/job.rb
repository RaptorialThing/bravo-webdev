class Job < ApplicationRecord
	belongs_to :headhunter
	enum status: [:active, :inactive]
end
