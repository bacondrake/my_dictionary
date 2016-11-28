class CreateDefinitions < ActiveRecord::Migration[5.0]
  def change
    create_table :definitions do |t|
      t.text :word
      t.text :meaning
      t.text :sample
      t.text :comments

      t.timestamps
    end
  end
end
