require 'rails_helper'

feature 'An user can only edit his owns videos' do

  scenario 'cant view edit button without a login' do
    video = create(:video, clip: clip_path, thumbnail: thumbnail_path)

    visit root_path
    click_on video.title

    expect(page).not_to have_content('Editar')
  end

  scenario 'can only view his own videos edit button' do
    video = create(:video, clip: clip_path, thumbnail: thumbnail_path)
    user = create(:user)
    login_as user, scope: :user

    visit root_path
    click_on video.title

    expect(page).not_to have_content('Editar')
  end

  scenario 'and can edit his own video' do
    user = create(:user)
    video = create(:video, clip: clip_path, thumbnail: thumbnail_path, user: user)
    login_as user, scope: :user

    visit root_path
    click_on video.title

    expect(page).to have_content('Editar')
  end

  scenario 'cant access the edit_path without a login' do
    video = create(:video, clip: clip_path, thumbnail: thumbnail_path)
    
    visit edit_video_path(video)

    expect(current_path).to eq new_user_session_path
  end
end