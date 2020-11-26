require 'rails_helper'

feature 'Visitant can access home page' do
  scenario 'and view all registered videos' do
    videoA = Video.create!(title: 'Video 1', description: 'Video1')
    videoB = Video.create!(title: 'Video 2', description: 'Video2')

    visit root_path

    expect(page).to have_content('DEVideo')
    expect(page).to have_content(videoA.title)
    expect(page).to have_content(videoB.title)
  end
end