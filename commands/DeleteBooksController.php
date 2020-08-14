<?php

namespace app\commands;

use yii\console\Controller;
use app\models\Books;
use yii\console\ExitCode;

class DeleteBooksController extends Controller
{
    public function actionDelete()
    {
        return Books::deleteAll('to_days(now())-to_days(date) >= 365');
    }
}
