<?php

namespace app\modules\api\modules\v1\controllers;

use app\modules\api\modules\v1\models\Books;
use yii\rest\ActiveController;
use yii\web\Response;

class BooksController extends ActiveController
{
    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;
        return $behaviors;
    }

    public $modelClass = 'app\modules\api\modules\v1\models\Books';

    public function actionList()
    {
        return Books::find()->all();
    }

    public function actionFind($id)
    {
        return Books::findOne($id);
    }

    public function actionView()
    {
        return $this->render('index');
    }
}
