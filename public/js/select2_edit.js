var baseUrl = window.location.protocol + '//' + window.location.host;
  $('#tag').select2({
     multiple: true,
     tags: true,
     tokenSeparators: [',', ' '],
     ajax: {
         url: baseUrl + '/posts/getTags/',
         dataType: 'json',
         data: function (params) {
             return {
                 q: $.trim(params.term)
             };
         },
         processResults: function (data) {
             return {
                 results: data
             };
         },
         cache: true
     },
 });
$('#tag').change(function() {
    var value = $(this).val();
      if (value.length > 5) {
        $('#tag option:last').remove();
      }

   value.forEach(function(tag) {
       if (tag.length > 15) {
           $('#tag option:last').remove();
       }
   });
});