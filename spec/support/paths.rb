def clip_path
  fixture_file_upload('./spec/video/test_video.mp4', 'video/mp4')
end

def thumbnail_path
  fixture_file_upload('./spec/video/cat.jpg', 'image/jpg')
end