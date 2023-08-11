class AddImageToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :image, :binary
  end
end
