<?php

namespace app\models;

use Yii;
use yii\data\ActiveDataProvider;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "car".
 *
 * @property integer $id
 * @property integer $mark_id
 * @property integer $model_id
 * @property integer bodytype_id
 * @property integer price
 * @property string photo
 * @property string description
 * @property integer date_add
 */
class Car extends ActiveRecord
{
    public static function tableName()
    {
        return 'car';
    }

    public function rules()
    {
        return [
            [['mark_id', 'model_id', 'bodytype_id'], 'required'],
            [['mark_id', 'model_id', 'bodytype_id', 'price', 'date_add'], 'integer'],
            [['photo', 'description'], 'string'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'mark_id' => 'Mark ID',
            'model_id' => 'Model ID',
            'bodytype_id' => 'Bodytype ID',
            'price' => 'Price',
            'photo' => 'Photo',
            'description' => 'Description',
            'date_add' => 'date add',
        ];
    }

    public static function getCarById($id)
    {
        return self::find()->where(['id' => $id])->one();
    }

    public function getMark()
    {
        return $this->hasOne(CarMark::className(), ['id' => 'mark_id']);
    }

    public function getColors()
    {
        return $this->hasMany(Color::classname(), ['id' => 'color_id'])
            ->viaTable('car_ref_color', ['car_id' => 'id']);
    }


    public static function getCarsDataProvider()
    {
        $onPage = 5;
        $limit = [1, 50];

        $query = self::find()->with('colors')->all();
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'defaultPageSize' => $onPage,
                'pageSizeParam' => 'onPage',
                'pageSizeLimit' => $limit,
                'forcePageParam' => false,
                'pageParam' => 'page',
            ],
        ]);

        return $dataProvider;
    }

    public static function addRecord($mark_id, $model_id, $bodytype_id, $price, $photo, $description)
    {
        $obj = new self;
        $obj->mark_id = $mark_id;
        $obj->model_id = $model_id;
        $obj->bodytype_id = $bodytype_id;
        $obj->price = $price;
        $obj->photo = $photo;
        $obj->description = $description;
        $obj->date_add = time();
        $obj->save();

        return $obj;
    }
}
