function submitQuestion() {
  document.getElementById("newQuestion").submit();
  var oldButtonLabel = document.getElementById("submitNewQuestion").innerHTML;
  document.getElementById("submitNewQuestion").innerHTML = "Submitted!";
  setTimeout(function(){document.getElementById("submitNewQuestion").innerHTML = oldButtonLabel;}, 600);

}
