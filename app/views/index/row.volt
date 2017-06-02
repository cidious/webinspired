<tr id="item{{ i.id }}">
 <td>{{ i.id }}</td>
 <td>{{ i.name }}</td>
 <td>{{ i.cat.name }}</td>
 <td>{{ i.price }}</td>
 <td><button type="button" class="btn btn-primary" aria-label="Left Align" data-toggle="modal" data-target="#editItem" data-item="{{ i.id }}" title="Исправить {{ i.name }}">
   <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
  </button>
  <button type="button" class="btn btn-danger item-del" aria-label="Left Align" data-item="{{ i.id }}" title="Удалить {{ i.name }}">
   <span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span>
  </button></td>
</tr>
