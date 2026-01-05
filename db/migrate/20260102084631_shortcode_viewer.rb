class ShortcodeViewer < ActiveRecord::Migration[8.1]
  def up
    execute <<-SQL
      CREATE VIEW shortcode_viewer AS
      SELECT short_code,clicks
      FROM urls;
    SQL
  end

  def down
    execute "Drop VIEW IF EXISTS shortcode_viewer;"
  end
end
