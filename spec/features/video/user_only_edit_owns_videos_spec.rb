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

  scenario 'and been redirect if try to access onthers videos edits' do
    user = create(:user)
    video = create(:video, clip: clip_path, thumbnail: thumbnail_path, user: user)
    another_user = create(:user)
    
    login_as another_user, scope: :user

    visit edit_video_path(video)

    expect(page).to have_content('Acesso Negado!')
    expect(current_path).to eq(root_path)
  end
end