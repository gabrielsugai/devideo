require 'rails_helper'

feature 'User register a video' do
  scenario 'successfully' do
    
    visit root_path
    click_on 'Novo video'

    fill_in 'Título', with: 'Video teste'
    fill_in 'Descrição', with: 'Video para testes'
    attach_file 'Video', './spec/video/test_video.mp4'
    attach_file 'Thumbnail', './spec/video/Captura de tela de 2020-11-26 23-28-59.png'
    click_on 'Upload'

    expect(page).to have_content('Video enviado com sucesso!')
    expect(page).to have_content('Video teste')
    expect(page).to have_content('Video para testes')
  end
end