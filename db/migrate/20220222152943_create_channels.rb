class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :channel

      t.timestamps
    end
  # end

  # def change
    create_table :replies do |t|
      t.text :reply

      t.timestamps
    end
  end
end
