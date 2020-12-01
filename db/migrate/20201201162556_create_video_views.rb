class CreateVideoViews < ActiveRecord::Migration[6.0]
  def change
    create_table :video_views do |t|
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
