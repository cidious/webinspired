<?php
namespace Models;

use Phalcon\Mvc\Model;

class Item extends Model
{
    /** @var int */
    public $id;
    /** @var int */
    public $category_id;
    /** @var string */
    public $name;
    /** @var float */
    public $price;
    /** @var string */
    public $description;
    /** @var string */
    public $spec;
    /** @var int */
    public $qty;

    public function initialize() {
        $this->belongsTo('category_id', 'Models\\Category', 'id',
            [ 'alias' => 'cat' ]);
    }

}