<?php

namespace backend\models;

use common\models\User;

/**
 * Description of LoginForm
 *
 * @author Timothee
 */
class LoginForm extends \common\models\LoginForm
{
    /**
     * @var string
     */
    public $captcha;
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['username', 'password'], 'required'],
            // rememberMe must be a boolean value
            ['rememberMe', 'boolean'],
            // password is validated by validatePassword()
            ['password', 'validatePassword'],
            
            ['captcha', 'required'],
            ['captcha', 'captcha'],
            
            //On vérifie que le compte n'est pas bloqué
            ['username', 'validateStatus'],
            //On incrémente le nombre de tentatives si erreurs
            [['password', 'captcha'], 'validateAttempts']
        ];
    }
    
    public function login()
    {
        $ok = parent::login();
        if($ok)
        {
            $user = $this->getUser();
            if($user && !$user->blocked) {
                $user->attempts = null;
                $user->update(false, ['attempts']);
            }
        }
        
        return $ok;
    }
    
    /**
     * 
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validateStatus($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if ($user && $user->blocked) {
                $this->addError($attribute, "Le compte est bloqué.");
            }
        }
    }
    
    /**
     * 
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validateAttempts($attribute, $params)
    {
        if($this->hasErrors()) 
        {
            $user = $this->getUser();
            if($user && !$user->blocked) 
            {
                $user->attempts++;
                $user->update(false, ['attempts']);
                if($user->attempts >= User::MAX_ATTEMPTS) {
                    $user->blocked = 1;
                    $user->update(false, ['blocked']);
                    $this->addError('username', "Le nombre maximum de tentatives de connexion a été atteint. Le compte est désormais bloqué.");
                }
            }
        }
    }
}
