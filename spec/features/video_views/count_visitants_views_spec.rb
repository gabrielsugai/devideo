require 'rails_helper'

feature 'System now count video views' do
  scenario 'successfully' do
    video = create(:video, clip: clip_path, thumbnail: thumbnail_path)
    create(:video_view, video: video)

    visit root_path
    click_on video.title

    expect(page).to have_content('1 visualizações')
  end

  scenario 'and show views in the index' do
    video = create(:video, clip: clip_path, thumbnail: thumbnail_path)
    create(:video_view, video: video)

    visit root_path

    expect(page).to have_content('1 visualizações')
  end
end