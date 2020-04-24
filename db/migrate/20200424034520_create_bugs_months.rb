class CreateBugsMonths < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs_months do |t|
      t.belongs_to :bug
      t.belongs_to :month
    end
  end
end
