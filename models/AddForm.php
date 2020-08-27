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
    public $photo;
    public $description;
    public $car_obj;

    public function rules()
    {
        $mark_validate = new CarMark;
        $mark_rules = $mark_validate->rules();
        $mark_name_max = 0;
        foreach ($mark_rules as $rule) {
            if (array_key_exists('max', $rule) && ($rule[0] == 'name' || in_array('name', $rule[0]))) {
                $mark_name_max = $rule['max'];
                break;
            }
        }
        $model_validate = new CarModel;
        $model_rules = $model_validate->rules();
        $model_name_max = 0;
        foreach ($model_rules as $rule) {
            if (array_key_exists('max', $rule) && ($rule[0] == 'name' || in_array('name', $rule[0]))) {
                $model_name_max = $rule['max'];
                break;
            }
        }
        $body_validate = new Bodytype;
        $body_rules = $body_validate->rules();
        $body_name_max = 0;
        foreach ($body_rules as $rule) {
            if (array_key_exists('max', $rule) && ($rule[0] == 'name' || in_array('name', $rule[0]))) {
                $body_name_max = $rule['max'];
                break;
            }
        }

        $extensions = self::getPhotoExtensions();
        $extensions_names = '';
        foreach ($extensions as $extension_name) {
            $extensions_names .= $extension_name.', ';
        }
        $extensions_str = preg_replace("/,\s$/", '', $extensions_names);
        $extensions_names = mb_strtoupper($extensions_str);

        return [
            [['mark', 'model', 'bodytype', 'description'], 'string'],
            [['mark'], 'string', 'max' => $mark_name_max, 'tooLong' => 'Длина названия марки автомобиля не может превышать '.$mark_name_max.' символов!'],
            [['model'], 'string', 'max' => $model_name_max, 'tooLong' => 'Длина названия модели автомобиля не может превышать '.$model_name_max.' символов!'],
            [['bodytype'], 'string', 'max' => $body_name_max, 'tooLong' => 'Длина названия типа кузова автомобиля не может превышать '.$body_name_max.' символов!'],
            [['price'], 'integer', 'message' => 'Цена должна быть целым числом'],
            [['photo'], 'file', 'extensions' => $extensions_str, 'wrongExtension' => 'Доступные форматы '.$extensions_names],
            ['colors', 'each', 'rule' => ['integer']],
            [['mark', 'model', 'price'], 'required', 'message' => 'Введите значение'],
            [['colors'], 'required', 'message' => 'Выберите хотя бы 1 цвет'],
        ];
    }

    public static function getPhotoExtensions()
    {
        return ['jpg', 'jpeg', 'png'];
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
        if ($mark_id > 0 && $model_id > 0 && $bodytype_id > 0) {
            $this->car_obj = Car::addRecord($mark_id, $model_id, $bodytype_id, $this->price, $this->description);
            if ($this->car_obj->id > 0) {
                foreach ($colors_ids_arr as $color_id) {
                    CarRefColor::addRecord($this->car_obj->id, $color_id);
                }
            } else {
                //произошла ошибка с добавлением автомобиля
                return null;
            }
        } else {
            //произошла ошибка с добавлением
            return null;
        }

        return $this;
    }
}