<?php
namespace Models;

use Phalcon\Mvc\Model;

class Category extends Model
{
    /** @var int */
    public $id;
    /** @var string */
    public $name;
    /** @var int */
    public $position;
    /** @var int */
    public $parent_id;

    public function initialize() {
        $this->belongsTo('parent_id', 'Models\\Category', 'id',
            [ 'alias' => 'parent' ]);
    }

}