class DestroyFeeds < ActiveRecord::Migration[7.1]
  def change
    drop_table :feeds
  end
end
