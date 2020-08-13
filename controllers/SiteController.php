<?php

namespace app\controllers;

use app\models\AddForm;
use app\models\CarMark;
use app\models\CarModel;
use Yii;
//use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
//use yii\filters\VerbFilter;
//use app\models\LoginForm;
//use app\models\ContactForm;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    /*public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }*/

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            /*'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],*/
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Displays add car page.
     *
     * @return string
     */
    public function actionCarAdd()
    {
        $post = Yii::$app->request->post();
        $form = new AddForm($post);

        return $this->render('car-add', ['add_form' => $form]);
    }

    /**
     * Inicilize catalog.
     *
     * @return string
     */
    /*public function actionCatalogInit()
    {
        $marks = ['Lexus', 'Toyota'];
        $models = ['Lexus' => ['ES', 'GX'], 'Toyota' => ['Camry', 'Corolla', 'RAV4']];
        $log = "";

        foreach ($marks as $mark_name) {
            $mark_obj = CarMark::addRecord($mark_name);
            $log .= 'Добавлен CarMark ID='.$mark_obj->id.' '.$mark_obj->name.'<br />';
            if ($mark_obj && isset($models[$mark_name])) {
                foreach ($models[$mark_name] as $model_name) {
                    $model_obj = CarModel::addRecord($model_name, $mark_obj->id);
                    $log .= 'Добавлен CarModel ID='.$model_obj->id.' '.$mark_name.' '.$model_obj->name.'<br />';
                }
            }
        }

        return $this->render('catalog-init', ['log' => $log]);
    }*/

    /**
     * Login action.
     *
     * @return Response|string
     */
    /*public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        $model->password = '';
        return $this->render('login', [
            'model' => $model,
        ]);
    }*/

    /**
     * Logout action.
     *
     * @return Response
     */
    /*public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }*/

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    /*public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }*/

    /**
     * Displays about page.
     *
     * @return string
     */
    /*public function actionAbout()
    {
        return $this->render('about');
    }*/
}
