class AddSlugToChannels < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :slug, :string
    add_index :channels, :slug, unique: true
  end
end
