<?php

namespace app\modules\api\modules\v1\models;

use Yii;

/**
 * This is the model class for table "{{%hismith_books}}".
 *
 * @property int $id
 * @property string $book
 * @property int $cost
 * @property int $author_id
 * @property string $date
 */
class Books extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */

    public function getAuthors()
    {
        return $this->hasMany(Authors::className(), ['id' => 'author_id']);
    }

    public static function tableName()
    {
        return '{{%hismith_books}}';
    }

    public function fields()
    {
        return [
            'id',
            'book',
            'cost',
            'author_id',
            'date',
        ];
    }

    public function extraFields()
    {
        return [
            'authors',
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['book', 'cost', 'author_id', 'date'], 'required'],
            [['book'], 'string'],
            [['cost', 'author_id'], 'integer'],
            [['date'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'book' => 'Book',
            'cost' => 'Cost',
            'author_id' => 'Author ID',
            'date' => 'Date',
        ];
    }
}
