require 'rails_helper'

feature 'User can register' do
  scenario 'successfully' do
    visit root_path
    click_on 'Registrar-se'

    fill_in 'E-mail', with: 'email@email.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirme sua senha', with: '12345678'
    click_on 'Inscrever-se'

    expect(page).to have_content('Login efetuado com sucesso. Se não foi autorizado, a confirmação será enviada por e-mail.')
    expect(current_path).to eq root_path
  end

  scenario 'and can login' do
    user = create(:user)

    visit root_path

    click_on 'Entrar'

    fill_in 'E-mail', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso!')
    expect(page).not_to have_content('Registrar-se')
    expect(page).not_to have_content('Entrar')
    expect(current_path). to eq root_path
  end

  scenario 'and can logout' do
    user = create(:user)

    visit root_path
    click_on 'Entrar'

    fill_in 'E-mail', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Log in'
    click_on 'Sair'

    expect(page).to have_content('Saiu com sucesso')
    expect(page).to have_content('Entrar')
    expect(page).not_to have_content('Sair')
    expect(current_path).to eq root_path

  end
end