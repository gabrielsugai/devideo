require 'rails_helper'

feature 'Visitant can access home page' do
  scenario 'and view all registered videos' do
    videoA = Video.create!(title: 'Video 1', description: 'Video1', 
                          clip: fixture_file_upload('./spec/video/test_video.mp4', 'video/mp4'), 
                          thumbnail: fixture_file_upload('./spec/video/image.png', 'image/png') )
    videoB = Video.create!(title: 'Video 2', description: 'Video2', 
                          clip: fixture_file_upload('./spec/video/test_video.mp4', 'video/mp4'), 
                          thumbnail: fixture_file_upload('./spec/video/image.png', 'image/png') )

    visit root_path

    expect(page).to have_content('DEVideo')
    expect(page).to have_content(videoA.title)
    expect(page).to have_content(videoB.title)
  end

  scenario 'and can view a video details' do
    videoA = Video.create!(title: 'Video 1', description: 'Video1', 
                          clip: fixture_file_upload('./spec/video/test_video.mp4', 'video/mp4'), 
                          thumbnail: fixture_file_upload('./spec/video/image.png', 'image/png') )
    videoB = Video.create!(title: 'Video 2', description: 'Video2', 
                          clip: fixture_file_upload('./spec/video/test_video.mp4', 'video/mp4'), 
                          thumbnail: fixture_file_upload('./spec/video/image.png', 'image/png') )


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