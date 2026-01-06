class ShortcodeViewer < ApplicationRecord
    self.table_name = "shortcode_viewer"
  def readonly?
    true
  end
end
