class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :event, index: true, null: false

      t.timestamps
    end
  end
end
