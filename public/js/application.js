$(document).ready(function() {
  giphyButtonListener();
  registerFormListener();
  loginFormListener();
  // signSubmitListener();
});


var giphyButtonListener = function(){
  $('#giphy_input').on("submit", function(event){
    event.preventDefault();

    var postSubmitQueryTarget = $(this);
    var address = postSubmitQueryTarget.attr('action');
    var method = postSubmitQueryTarget.attr('method');
    var data = postSubmitQueryTarget.serialize();

    var request = $.ajax({
      url: address,
      method: method,
      data: data
    });

    request.done(function(response){
      console.log("success");
      $('#gif-div').html("<img src="+response+">");
    });

    request.fail(function(response){
      console.log("something went wrong!");
    });

  })
};

var loginFormListener = function(){
  $("#user_header").on("click", "#user_login", function(event){
    event.preventDefault();

    var loginFormTarget = $(this);
    var url = loginFormTarget.attr('href');
    var method = loginFormTarget.attr('method');

    var request = $.ajax({
      url: url,
      method: method
    });

    request.done(function(response){
      $("#partial-header-home").replaceWith(response);
    });

    request.fail(function(response){
      console.log("fail!");
    });
  });
};

var registerFormListener = function(){
  $("#user_header").on("click", "#user_register", function(event){
    event.preventDefault();
    console.log("in the click");
    var registerFormTarget = $(this);
    var url = registerFormTarget.attr('href');
    var method = registerFormTarget.attr('method');

    var request = $.ajax({
      url: url,
      method: method
    });

    request.done(function(response){
      console.log(response);
      $("#partial-header-home").replaceWith(response);
    });

    request.fail(function(response){
      console.log("fail!");
    });
  });
};

// var signSubmitListener = function(){
//   $("#cheer_caller").on("submit", function(event){
//     event.preventDefault();

//     var signSubmitTarget = $(this);
//     var url = signSubmitTarget.attr('action');
//     var method = signSubmitTarget.attr('method');
//     var data = signSubmitTarget.serialize();

//     var request = $.ajax({
//       url: url,
//       method: method,
//       data: data
//     });

//     request.done(function(response){
//       console.log(response);
//       $("#sign-response").append(response);
//     });
//   });
// };