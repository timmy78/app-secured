<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            //'suffix' => '.html',
            'rules' => [
                '<action:(login|signup|logout|contact|about)>' => 'site/<action>',
                '/' => 'site/index',
            ]
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
    ],
];
