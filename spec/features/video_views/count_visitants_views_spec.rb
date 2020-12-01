require 'rails_helper'

feature 'Visitant click on play and count one view' do
  scenario 'successfully' do
    video = create(:video, clip: clip_path, thumbnail: thumbnail_path)

    visit root_path
    click_on video.title
    find('.video-js').click

    expect(page).to have_content('1 visualizações')
  end
end