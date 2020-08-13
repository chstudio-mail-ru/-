<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "mark".
 *
 * @property integer $id
 * @property string $name
 * @property integer $date_add
 */
class CarMark extends ActiveRecord
{
    public static function tableName()
    {
        return 'mark';
    }

    public function rules()
    {
        return [
            [['name'], 'required'],
            [['name'], 'string', 'max' => 100],
            [['date_add'], 'integer'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'date_add' => 'date add',
        ];
    }

    public static function getByName($name)
    {
        return self::find()->where(['name' => $name])->one();
    }

    public static function getById($id)
    {
        return self::find()->where(['id' => $id])->one();
    }

    public static function getAll()
    {
        return self::find()->all();
    }

    public static function addRecord($name)
    {
        $obj = self::getByName($name);

        if (!$obj) {
            $obj = new self;
            $obj->name = $name;
            $obj->date_add = time();
            $obj->save();
        }

        return $obj;
    }
}
