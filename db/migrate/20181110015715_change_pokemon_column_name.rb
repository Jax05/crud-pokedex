class ChangePokemonColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :pokemons, :type, :type_name
  end
end
