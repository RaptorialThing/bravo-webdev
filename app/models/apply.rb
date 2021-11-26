class Apply < ApplicationRecord
	belongs_to :applicable, :polymorphic => true
end
