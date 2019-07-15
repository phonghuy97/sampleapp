$('#micropost_picture').bind('change', function() {
  var size_in_megabytes = this.files[0].size/1024/1024;
  if (size_in_megabytes > 5) {
<<<<<<< HEAD
    alert (I18n.t("model.micropost.notication"));
=======
    alert('Maximum file size is 5MB. Please choose a smaller file.');
>>>>>>> 39ef3c80ed52891d3b63ad445f8dbfb3eb1fdd5e
  }
});
