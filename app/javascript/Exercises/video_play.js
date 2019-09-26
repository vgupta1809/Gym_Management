document.addEventListener("turbolinks:load", function(){
 //window.onload = function localFileVideoPlayer() {
  'use strict'
  var URL = window.URL || window.webkitURL
  var playSelectedFile = function (event) {
    var file = this.files[0]
    var type = file.type
    var videoNode = document.querySelector('video')
    var canPlay = videoNode.canPlayType(type)
    if (canPlay === '') canPlay = 'no'
    var isError = canPlay === 'no'

    if (isError) {
      return
    }

    var fileURL = URL.createObjectURL(file)
    videoNode.src = fileURL
  }

  var inputNode = document.getElementById('exercise_video')
  if(inputNode)
    inputNode.addEventListener('change', playSelectedFile, false) 
//}

})