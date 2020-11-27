require 'rails_helper'

feature 'Visitant can view a video' do
  scenario 'successfully' do
    video = create(:video, clip: clip_path, thumbnail: thumbnail_path)

    visit root_path
    click_on video.title

    expect(page).to have_css('video')
  end
end