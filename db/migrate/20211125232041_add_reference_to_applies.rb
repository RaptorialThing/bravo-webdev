class AddReferenceToApplies < ActiveRecord::Migration[6.1]
  def change
    add_column :applies, :applicable_id, :bigint
    add_column :applies, :applicable_type, :string
  end
end
