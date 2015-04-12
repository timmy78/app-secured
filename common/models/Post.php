<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "post".
 *
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $user_id
 * 
 * @property User $author
 */
class Post extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            \yii\behaviors\TimestampBehavior::className(),
        ];
    }
    
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'post';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'description', 'user_id'], 'required'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'user_id'], 'integer'],
            [['title'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'description' => Yii::t('app', 'Description'),
            'created_at' => Yii::t('app', 'Ajouté le'),
            'updated_at' => Yii::t('app', 'Modifié le'),
            'user_id' => Yii::t('app', 'User ID'),
        ];
    }
    
    /** 
     * @return \yii\db\ActiveQuery 
     */ 
    public function getAuthor() 
    { 
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    } 
}
