class AddCreatorToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :creator, :int
  end
end
