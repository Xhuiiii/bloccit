class AddRanksToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :rank, :float
  end
end
