class AddUserTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_type, :string, default: :member #the main diff between string and symbol is that the latter would be unique whereasa string wouldn't be unique usually Jamie does it as a string.
  end
end
