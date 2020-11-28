require 'rails_helper'

feature 'User can register' do
  scenario 'successfully' do
    visit root_path
    click_on 'Login'

    fill_in 'E-mail', with: 'email@email.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirme sua senha', with: '12345678'
    click_on 'Inscrever-se'

    expect(page).to have_content('Login efetuado com sucesso. Se não foi autorizado, a confirmação será enviada por e-mail.')
    expect(current_path).to eq root_path
  end
end