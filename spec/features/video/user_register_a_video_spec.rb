require 'rails_helper'

feature 'User register a video' do
  scenario 'successfully' do
    
    visit root_path
    click_on 'Novo video'

    fill_in 'Título', with: 'Video teste'
    fill_in 'Descrição', with: 'Video para testes'
    attach_file 'Video', './spec/video/test_video.mp4'
    attach_file 'Thumbnail', './spec/video/image.png'
    click_on 'Upload'

    expect(page).to have_content('Video enviado com sucesso!')
    expect(page).to have_content('Video teste')
    expect(page).to have_content('Video para testes')
  end

  scenario "And din't fill somefield" do
    
    visit root_path
    click_on 'Novo video'

    fill_in 'Título', with: ''
    fill_in 'Descrição', with: ''
    click_on 'Upload'

    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Clip não pode ficar em branco')
    expect(page).to have_content('Thumbnail não pode ficar em branco')
  end

  scenario 'And may edit some information' do
    video = Video.create!(title: 'Video 1', description: 'Video1', 
                          clip: fixture_file_upload('./spec/video/test_video.mp4', 'video/mp4'), 
                          thumbnail: fixture_file_upload('./spec/video/image.png', 'image/png') )
    
    visit root_path
    click_on video.title
    click_on 'Editar'

    fill_in 'Título', with: 'Video teste'
    fill_in 'Descrição', with: 'Video para testes'
    click_on 'Upload'

    expect(page).to have_content('Video teste')
    expect(page).to have_content('Video para testes')

    expect(page).not_to have_content('Video 1')
    expect(page).not_to have_content('Video1')
  end
end