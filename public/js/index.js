$(function() {
 var editItem = $('#editItem');
 editItem.on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var modal = $(this);
  var id = button.data('item');

  if (id) {
   $.ajax({
    url:'/index/ajaxGetItem/'+id,
    type: "GET",
    dataType: "JSON"
   })
    .done(function (response) {
     if (response.result) {
      modal.find('.modal-body #item-name').val(response.result.name);
      modal.find('.modal-body #item-description').html('').html(response.result.description);
      modal.find('.modal-body #item-price').val(response.result.price);
      modal.find('.modal-body #item-category').val(response.result.category_id);
      modal.find('.modal-body #item-id').val(response.result.id);
     } else {
      alert('нет данных по данному товару');
     }
    });
  } else {
   modal.find('.modal-body #item-name').val('');
   modal.find('.modal-body #item-description').html('');
   modal.find('.modal-body #item-price').val('');
   modal.find('.modal-body #item-category').val(1);
   modal.find('.modal-body #item-id').val(0);
  }
 });
 editItem.on('shown.bs.modal', function (event) {
  $('.modal-body #item-name').focus();
 });

 $('#itemEditForm').submit(function() {
  $.ajax({
   url:'/index/ajaxSaveItem',
   type: "POST",
   dataType: "JSON",
   data: {
    id: $('.modal-body #item-id').val(),
    name: $('.modal-body #item-name').val(),
    category: $('.modal-body #item-category').val(),
    price: $('.modal-body #item-price').val(),
    description: $('.modal-body #item-description').val()
   }
  })
   .done(function (response) {
    if (response.result) {
     $('#editItem').modal('hide');
     var id = response.id;
     $.ajax({
      url:'/index/ajaxGetRow/'+id,
      type: "GET",
      dataType: "JSON"
     })
      .done(function (response) {
       var row = $('#item'+response.id);
       if (row.length > 0) {
        $('#item'+response.id).replaceWith(response.result);
       } else {
        $('#itemTable tbody').append(response.result);
       }
      });
    }
  });

  return false;
 });

 $('button.item-del').click(function() {
  var id = $(this).data('item');
  if (confirm('Удалить '+$(this).attr('title')+'?')) {
   $.ajax({
    url:'/index/ajaxDelItem',
    type: "POST",
    dataType: "JSON",
    data: {
     id: id
    }
   })
    .done(function(response) {
     if (response.result) {
      $('#item'+id).remove();
     }
    });
  }
 });
});