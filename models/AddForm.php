<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * AddForm is the model behind the add form.
 *
 */
class AddForm extends Model
{
    public $mark;
    public $mark_id;
    public $model;
    public $model_id;
    public $price;
    public $bodytype;
    public $bodytype_id;
    public $colors;
    public $description;

    public function __construct($config = [])
    {
        parent::__construct($config);

        if (isset($config['mark'])) {
            $this->mark = $config['mark'];
            $mark_obj = CarMark::addRecord($this->mark);
            $this->mark_id = ($mark_obj)? $mark_obj->id : null;
        }
        if ($this->mark_id > 0 && isset($config['model'])) {
            $this->model = $config['model'];
            $model_obj = CarModel::addRecord($this->model, $this->mark_id);
            $this->model_id = ($model_obj)? $model_obj->id : null;
        }
        if (isset($config['price'])) {
            $this->price = intval($config['price']);
        }
        if (isset($config['bodytype'])) {
            $this->bodytype = $config['bodytype'];
            $bodytype_obj = Bodytype::addRecord($this->model, $this->mark_id);
            $this->model_id = ($model_obj)? $model_obj->id : null;
        }
    }
}