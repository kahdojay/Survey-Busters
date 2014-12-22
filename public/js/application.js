$(document).ready(function() {
  $('#survey_submit').on('submit', function(event){
    event.preventDefault();
    if (check_all_responded()){
      var $target = $(event.target);
      $.ajax({
        url: $target.attr('action'),
        type: 'GET',
        data: $target.serialize()
      }).done(function(response){
        console.log(response);
      });
    }
    else{
      alert("Some of the questions are not answered.");
    }

  });
});


function check_all_responded(){
  return $('input[type="radio"]:checked').length == 2;//$('.question').length;
};

// function get_answer_id(element){
//   element.name.split('_')[1]
// };

function get_all_responses(){
  answered_ids = [];
  $('input[type="radio"]:checked').toArray().forEach(function(answer) {
    answered_ids.push(answer.name.split('_')[1]);
    });
  console.log(answered_ids);
  return answered_ids;
};

