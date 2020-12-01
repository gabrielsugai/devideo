require 'rails_helper'

RSpec.describe VideoView, type: :model do 

  it 'must belongs to video' do
    video = create(:video, clip: clip_path, thumbnail: thumbnail_path)
    video_view = create(:video_view, video: video)
    expect(video_view).to belong_to(:video)
  end
end