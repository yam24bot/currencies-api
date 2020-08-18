class CreateCurrency < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      enable_extension "hstore"
      t.hstore :rates

      t.timestamps
    end
  end
end
