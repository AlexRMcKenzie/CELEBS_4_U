class AddUrlToCelebrities < ActiveRecord::Migration[7.0]
  def change
    add_column :celebrities, :url, :string
  end
end
