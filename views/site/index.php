<?php

/* @var $this yii\web\View */
/* @var $dp yii\data\ActiveDataProvider */
/* @var $title string */
/* @var $description string */

$this->title = 'Webelement каталог автомобилей';
?>
<div id="catalog-list">
    <?= $this->renderAjax('_car_list', ['dp' => $dp]) ?>
</div>

