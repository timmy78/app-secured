<?php
/* @var $this yii\web\View */

use yii\helpers\Url;

$this->title = Yii::$app->name;
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>Backoffice</h1>


        <p><a class="btn btn-lg btn-success" href="<?= Url::to(['/post/index']) ?>">Gérer les posts</a></p>
    </div>

</div>
