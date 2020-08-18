<?php

/* @var $this yii\web\View */
/* @var $model app\models\Car */

use yii\bootstrap\Html;

$this->title = $model->mark->name.' '.$model->model->name;

$extensions = \app\models\AddForm::getPhotoExtensions();
$photo = Html::img('/images/nophoto.jpg');
foreach ($extensions as $ext) {
    if (file_exists(Yii::getAlias('@webroot', 'images/'.$model->id.'-photo.'.$ext))) {
        $photo = Html::img('/images/'.$model->id.'-photo.'.$ext);
        break;
    }
}
$formatter = new NumberFormatter('ru_RU', NumberFormatter::CURRENCY);
$formatter->setSymbol(NumberFormatter::CURRENCY_SYMBOL, 'р.');
?>
<div>
    <?= $photo ?>
</div>
<div>
    <?= $model->mark->name ?>
</div>
<div>
    <?= $model->model->name ?>
</div>
<div>
    <?= $formatter->formatCurrency($model->price, 'RUR') ?>
</div>
<div>
    <?= $model->bodytype->name ?>
</div>
<div>
    <?php
    $colors = '';
    foreach($model->colors as $color) {
        $colors .= $color->name.', ';
    }
    $colors = preg_replace("/,\s$/", '', $colors);
    echo $colors;
    ?>
</div>
<?php
    if (strlen($model->description) > 0) {
        ?>
        <div>
            <?= $model->description ?>
        </div>
        <?php
    }
?>





