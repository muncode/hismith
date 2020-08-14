<?php

namespace app\modules\api\modules\v1\controllers;

use yii\rest\ActiveController;
use yii\web\Response;

class AuthorsController extends ActiveController
{
    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;
        return $behaviors;
    }

    public $modelClass = 'app\modules\api\modules\v1\models\Authors';

    public function actionIndex()
    {
        return $this->render('index');
    }

}
