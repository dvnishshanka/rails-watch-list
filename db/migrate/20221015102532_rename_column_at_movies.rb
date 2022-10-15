class RenameColumnAtMovies < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :postal_url, :poster_url
  end
end
