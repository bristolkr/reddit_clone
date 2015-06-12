class CreateSts < ActiveRecord::Migration
  def change
    create_table :sts do |t|

      t.timestamps null: false
    end
  end
end
