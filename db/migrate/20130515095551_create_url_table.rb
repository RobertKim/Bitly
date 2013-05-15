class CreateUrlTable < ActiveRecord::Migration
  def change
    create_table :urls do |column|
      column.string :url
      column.string :short_url
    end
  end
end
