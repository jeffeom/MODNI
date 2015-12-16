class AddVlogLinkToVlogs < ActiveRecord::Migration
  def change
    add_column :vlogs, :link, :string
  end
end
