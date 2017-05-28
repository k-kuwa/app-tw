class ChangeTextToTweets < ActiveRecord::Migration[5.0]
  def change
    change_column_null :tweets, :text, true
    change_column_null :comments, :text, true
  end
end
