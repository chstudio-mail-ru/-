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
    public $model;
    public $price;
    public $colors;
    public $bodytype;
    public $description;

    public function rules()
    {
        return [
            [['mark', 'model', 'bodytype', 'description'], 'string'],
            [['price'], 'integer'],
            ['colors', 'each', 'rule' => ['integer']],
        ];
    }

    public function addCar()
    {
        $mark_id = 0;
        $model_id = 0;
        $bodytype_id = 0;
        if ($this->mark) {
            $mark_obj = CarMark::addRecord($this->mark);
            $mark_id = ($mark_obj)? $mark_obj->id : 0;
        }
        if ($mark_id > 0 && $this->model) {
            $model_obj = CarModel::addRecord($this->model, $mark_id);
            $model_id = ($model_obj)? $model_obj->id : 0;
        }
        if ($this->bodytype) {
            $bodytype_obj = Bodytype::addRecord($this->bodytype);
            $bodytype_id = ($bodytype_obj)? $bodytype_obj->id : 0;
        }
        $colors_ids_arr = $this->colors;

        $car_obj = Car::addRecord($mark_id, $model_id, $bodytype_id, $this->price, '', $this->description);
        foreach ($colors_ids_arr as $color_id) {
            CarRefColor::addRecord($car_obj->id, $color_id);
        }

        return 'Добавлено';
    }
}