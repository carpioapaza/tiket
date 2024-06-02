class AddConstraintsToTickets < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE tickets
          ADD CONSTRAINT quantity_available_check CHECK (quantity_available >= 0);

          ALTER TABLE tickets
          ADD CONSTRAINT price_check CHECK (price >= 0);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE tickets
          DROP CONSTRAINT IF EXISTS quantity_available_check;

          ALTER TABLE tickets
          DROP CONSTRAINT IF EXISTS price_check;
        SQL
      end
    end
  end
end
