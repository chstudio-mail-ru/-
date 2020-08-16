<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "car_ref_color".
 *
 * @property integer $id
 * @property integer $car_id
 * @property integer $color_id
 */
class CarRefColor extends ActiveRecord
{
    public static function tableName()
    {
        return 'car_ref_color';
    }

    public function rules()
    {
        return [
            [['car_id', 'color_id'], 'required'],
            [['car_id', 'color_id'], 'integer'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'car_id' => 'car id',
            'color_id' => 'color id',
        ];
    }

    public static function addRecord($car_id, $color_id)
    {
        $obj = new self;
        $obj->car_id = $car_id;
        $obj->color_id = $color_id;
        $obj->save();

        return $obj;
    }
}
