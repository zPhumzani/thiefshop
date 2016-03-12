class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :title
      t.decimal :price
      t.string :location
      t.text :description
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :slug

      t.timestamps null: false
    end
  end
end
