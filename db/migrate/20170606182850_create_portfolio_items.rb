class CreatePortfolioItems < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_items do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :tag

      t.timestamps
    end
  end
end
