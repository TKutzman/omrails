class AddUserContactToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_contact, :string
  end
end
