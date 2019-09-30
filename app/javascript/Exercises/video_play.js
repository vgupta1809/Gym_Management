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
  var displayExerciseBasedOnType = function (event){
    var value = this.value
    var obj = {
      type_id : value
    }
    if(value){
      $.getJSON("/workouts/type_exercises/",obj).done(function(data){
        var checkboxdom = document.getElementById('checkbox_ids');
        checkboxdom.innerHTML = '';
        $(checkboxdom).append('<input type="hidden" name="workout[exercise_ids][]" value="">');
        for(var i=0;i<data.exercises.length;i++){
          var id = data.exercises[i].id
          var name = data.exercises[i].name
          $(checkboxdom).append('<div class="collection-check-box"> <input name="workout[exercise_ids][]" type="checkbox" value = '+id+' id = "workout_exercise_ids_'+id+'"/><label for =  workout_exercise_ids_'+id+'>'+name+'</label></div>');
      }
      })
    }
  }
  var inputNode = document.getElementById('exercise_video')
  if(inputNode){
    inputNode.addEventListener('change', playSelectedFile, false) 
  }
  var type = document.getElementById('type')
  if(type){
    type.addEventListener('change', displayExerciseBasedOnType, false) 
  }
//}

})