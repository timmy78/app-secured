<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;
use common\models\User;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\PostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Posts');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Post'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'title',
            'description:ntext',
            [
                'attribute' => 'created_at',
                'value' => function($model, $key, $index, $widget) {
                    return Yii::$app->formatter->asDatetime($model->created_at, 'short');
                }
            ],
            //'updated_at',
            [
                'attribute' => 'user_id',
                'label' => 'Auteur',
                'value' => function($model, $key, $index, $widget) {
                    return $model->author->username;
                },
                'filter' => ArrayHelper::map(User::find()->all(),'id','username')
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
