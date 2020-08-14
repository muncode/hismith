<?php

namespace app\modules\api\modules\v1\models;

use Yii;

/**
 * This is the model class for table "{{%hismith_authors}}".
 *
 * @property int $id
 * @property string $name
 * @property int $amt
 */
class Authors extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */


    public function getBooks()
    {
        return $this->hasMany(Books::className(), ['author_id' => 'id']);
    }

    public static function tableName()
    {
        return '{{%hismith_authors}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'amt'], 'required'],
            [['name'], 'string'],
            [['amt'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'amt' => 'Amt',
        ];
    }
}
