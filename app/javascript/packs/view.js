import Rails from '@rails/ujs';

let page_loaded = 0
let videoId = document.getElementById('video-id').textContent
const videoPlayer = document.getElementById('my-video')

document.addEventListener('turbolinks:load', () => {
  page_loaded = 1
  console.log(page_loaded)
})


videoPlayer.addEventListener('play', () => {
  if(page_loaded){
    page_loaded = 0
    Rails.ajax({
      type: "POST",
      url: "/video_views",
      dataType: "json",
      data: 'video_view[video_id]=' + videoId
    })
  }
})