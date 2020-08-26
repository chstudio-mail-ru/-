<?php
/* @var $this yii\web\View */
/* @var $model app\models\Car */

use yii\bootstrap\Html;

$formatter = new NumberFormatter('ru_RU', NumberFormatter::CURRENCY);
$formatter->setSymbol(NumberFormatter::CURRENCY_SYMBOL, 'р.');

$extensions = \app\models\AddForm::getPhotoExtensions();
$photo = Html::img('/images/thumbs/nophoto.jpg');
foreach ($extensions as $ext) {
    if (file_exists(Yii::getAlias('@webroot/images/thumbs/'.$model->id.'-photo.'.$ext))) {
        $photo = Html::img('/images/thumbs/'.$model->id.'-photo.'.$ext);
        break;
    }
}
?>
<div>
    <?= Html::a($photo, '/car/'.$model->id).'&nbsp;&nbsp;&nbsp;'.Html::a($model->mark->name.' '.$model->model->name, '/car/'.$model->id).' '.$formatter->formatCurrency($model->price, 'RUR').'<br />'.mb_substr($model->description, 0, 250).((mb_strlen($model->description) > 250)? '...' : '') ?>
</div>
