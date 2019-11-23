class CreateRelationShips < ActiveRecord::Migration[5.2]
  def change
    create_table :relation_ships do |t|
      t.references :user, foregin_key: true
      t.references :follow

      t.timestamps
    end
  end
end
