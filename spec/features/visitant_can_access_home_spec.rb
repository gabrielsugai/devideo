require 'rails_helper'

feature 'Visitant can access home page' do
  scenario 'and view all registered videos' do
    videoA = create(:video, clip: clip_path, thumbnail: thumbnail_path)

    videoB = create(:video, clip: clip_path, thumbnail: thumbnail_path)


    visit root_path

    expect(page).to have_content('DEVideo')
    expect(page).to have_content(videoA.title)
    expect(page).to have_content(videoB.title)
  end

  scenario 'and can view a video details' do
    videoA = create(:video, clip: clip_path, thumbnail: thumbnail_path)

    videoB = create(:video, clip: clip_path, thumbnail: thumbnail_path)


    visit root_path
    click_on videoA.title

    expect(page).to have_content(videoA.title)
    expect(page).to have_content(videoA.description)
    expect(page).not_to have_content(videoB.title)
    expect(page).not_to have_content(videoB.description)

  end

  scenario 'and no video registered' do
    visit root_path

    expect(page).to have_content("Nenhum vídeo cadastrado.")
  end
end