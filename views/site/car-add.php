<?php

/* @var $this yii\web\View */
/* @var $add_form app\models\AddForm */

$this->title = 'Webelement Car add';

use yii\bootstrap\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;

$colors = \app\models\Color::getAll();

$form = ActiveForm::begin([
    'id'      => 'add_form',
    'method'  => 'post',
    'options' => ['enctype' => 'multipart/form-data']]);

echo $form->field($add_form, 'mark')->textInput()->label('Марка');
echo $form->field($add_form, 'model')->textInput()->label('Модель');
echo $form->field($add_form, 'price')->textInput()->label('Цена');
echo $form->field($add_form, 'bodytype')->textInput()->label('Тип кузова');
$items_color = ArrayHelper::map($colors,'id','name');
echo $form->field($add_form, 'colors')->dropDownList($items_color, ['multiple' => 'multiple'])->label('Цвета');

if (isset($add_form->photo) && file_exists(Yii::getAlias('@webroot', $add_form->photo))) {
    echo Html::img('/images/'.$add_form->photo);
}
echo $form->field($add_form, 'photo')->fileInput();
echo $form->field($add_form, 'description')->textarea()->label('Описание');

echo Html::submitButton('Добавить');

ActiveForm::end();

echo $result;
