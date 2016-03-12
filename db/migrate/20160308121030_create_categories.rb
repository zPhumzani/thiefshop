class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :categories, :name, unique: true

    Category.create name: "Electronics"
    Category.create name: "Real Estate"
    Category.create name: "Furniture"
    Category.create name: "Miscellaneous"
    Category.create name: "Antiques & Collectables"
    Category.create name: "Art"
    Category.create name: "Bikes"
    Category.create name: "Education & Books"
    Category.create name: "Cars"
    Category.create name: "Cell Phones & Accessories"
    Category.create name: "Clothing"
    Category.create name: "Computers & Networking"
    Category.create name: "Gaming"
    Category.create name: "Health & Beauty"
    Category.create name: "Jewellery & Watches"
    Category.create name: "Movies & Television"
    Category.create name: "Photo & Video"
    Category.create name: "Entertainment"
    Category.create name: "Adult Materail"
    Category.create name: "Technology"
  end
end
