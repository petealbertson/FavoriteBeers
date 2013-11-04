class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :brewery
      t.string :name
      t.string :style
      t.float :abv
      t.string :img
      t.string :nationality

      t.timestamps
    end
  end
end
