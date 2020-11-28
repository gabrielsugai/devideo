require 'rails_helper'

RSpec.describe Video, type: :model do

  it 'belongs to an user' do
    video = create(:video, clip: clip_path, thumbnail: thumbnail_path)
    expect(video).to belong_to(:user)
  end
end