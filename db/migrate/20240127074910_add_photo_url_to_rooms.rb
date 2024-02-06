class AddPhotoUrlToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :photo_url, :string, default: "/Users/user/Desktop/syuku_develop/syukuapp/app/assets/images/shisetsu/default-room-photo.png"
  end
end
