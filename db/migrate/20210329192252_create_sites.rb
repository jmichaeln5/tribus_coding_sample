class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :link
      t.string :title
      t.string :thumbnail_link
      t.text :description
      t.text :keyword_list
      t.integer :communal
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
