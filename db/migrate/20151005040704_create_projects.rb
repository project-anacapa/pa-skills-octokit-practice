class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.belongs_to :course

      t.string :repo
      t.string :access_token

      t.timestamps null: false
    end
  end
end
