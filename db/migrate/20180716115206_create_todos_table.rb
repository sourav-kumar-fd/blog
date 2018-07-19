class CreateTodosTable < ActiveRecord::Migration
  def change
  	create_table :todos do |t|
  		t.string :name
  		t.text :description
  	end
  end
end
