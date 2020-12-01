require 'rails_helper'

RSpec.describe Video, type: :model do
  subject { create :video, clip: clip_path, thumbnail: thumbnail_path}

  it 'belongs to an user' do
    expect(subject).to belong_to(:user)
  end

  it 'validates mandatory attributes' do
    expect(subject).to validate_presence_of(:title)
    expect(subject).to validate_presence_of(:description)
    expect(subject).to validate_presence_of(:url)
    expect(subject).to validate_presence_of(:clip)
    expect(subject).to validate_presence_of(:thumbnail)

  end

  context 'url' do
    
    it 'have to be a mp4 video type' do
      expect(subject).to be_valid
    end
    
    it 'have to return an error with another type of video' do
      subject.url = 'localhost/test.mp3'
      expect(subject).not_to be_valid
      expect(subject.errors[:url]).to include('não é válido')
    end
    
    it 'have to return an error with an invalid path' do
      subject.url = 'localhosttest.mp4'
      expect(subject).not_to be_valid
      expect(subject.errors[:url]).to include('não é válido')
    end
    
    it 'have to return an error without video type' do
      subject.url = 'localhost/test'
      expect(subject).not_to be_valid
      expect(subject.errors[:url]).to include('não é válido')
    end
    
  end
end