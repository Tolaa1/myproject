class ChangeLikeToLikes < ActiveRecord::Migration[5.2]
  def change
    rename_column :gifs, :like, :likes
  end
end
