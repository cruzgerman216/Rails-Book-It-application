class AddImagePathToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :image_path, :string, default: "https://upload.wikimedia.org/wikipedia/commons/b/b9/No_Cover.jpg"
  end
end
