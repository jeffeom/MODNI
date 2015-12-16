class AddVlogDateToVlogs < ActiveRecord::Migration
  def change
    add_column :vlogs, :vlog_date, :datetime
  end
end
