<table class="table" id="itemTable">
 <thead>
  <tr>
   <th>ID</th>
   <th>Наименование товара</th>
   <th>Категория товара</th>
   <th>Стоимость</th>
   <th><button type="button" class="btn btn-success" aria-label="Left Align" data-toggle="modal" data-target="#editItem" data-item="" title="Новый товар">
     <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
    </button></th>
  </tr>
 </thead>
 <tbody>
  {% for i in items %}
   {% include "index/row.volt" %}
  {% endfor %}
 </tbody>
 <tfoot></tfoot>
</table>

{% include "index/editWindow.volt" %}