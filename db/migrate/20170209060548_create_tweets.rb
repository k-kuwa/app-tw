class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string     :text, null: false, limit: 140
      t.string     :image
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
