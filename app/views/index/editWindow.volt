<div class="modal fade" tabindex="-1" role="dialog" id="editItem"
     aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
  <form id="itemEditForm">
   <div class="modal-content">
    <div class="modal-header">
     <button type="button" class="close" data-dismiss="modal"
             aria-label="Close"><span aria-hidden="true">&times;</span></button>
     <h4 class="modal-title">Карточка товара</h4>
    </div>
    <div class="modal-body">
     <div class="form-group">
      <label for="item-name" class="control-label">Название:</label>
      <input type="text" class="form-control" id="item-name">
     </div>
     <div class="form-group">
      <label for="item-description" class="control-label">Описание:</label>
      <textarea class="form-control" id="item-description" rows="7"></textarea>
     </div>
     <div class="form-group">
      <label for="item-price" class="control-label">Цена:</label>
      <input type="number" class="form-control" id="item-price" min="0"
             max="999999" step="any">
     </div>
     <div class="form-group">
      <label for="item-category" class="control-label">Категория:</label>
      {{ select('item-category', categories, 'using': ['id', 'name'], "class":"form-control") }}
     </div>
     <input type="hidden" name="item-id" id="item-id">
    </div>
    <div class="modal-footer">
     <button type="submit" class="btn btn-primary" id="button-save">Сохранить
     </button>
     <button type="button" class="btn btn-default" data-dismiss="modal">Отмена
     </button>
    </div>
   </div>
   <!-- /.modal-content -->
  </form>
 </div>
 <!-- /.modal-dialog -->
</div><!-- /.modal -->