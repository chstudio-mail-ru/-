<?php

namespace app\controllers;

use app\models\AddForm;
use app\models\CarMark;
use app\models\CarModel;
use Imagine\Image\Box;
use Yii;
//use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\web\UploadedFile;
use yii\imagine\Image;

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
        $form = new AddForm();
        $result = '';

        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            $form->load($post);
            $model = $form->addCar();
            $photo = UploadedFile::getInstance($model, 'photo');
            if ($photo && $photo->tempName) {
                $model->photo = $photo;
                if ($model->validate(['photo'])) {
                    $dir = Yii::getAlias('images/');
                    $fileName = $model->car_obj->id.'-photo.'.$model->photo->extension;
                    $model->photo->saveAs($dir.$fileName);
                    $model->photo = $fileName;
                    $photo = Image::getImagine()->open($dir . $fileName);
                    $photo->thumbnail(new Box(800, 800))->save($dir.$fileName, ['quality' => 90]);
                    $this->createDirectory(Yii::getAlias('images/thumbs/'));
                    Image::thumbnail($dir.$fileName, 200, 150)
                        ->save(Yii::getAlias($dir .'thumbs/'. $fileName), ['quality' => 80]);
                }
            }
            if ($model->car_obj->save()) {
                $result = "Добавлено.";
                $form = new AddForm();
                return $this->render('car-add', ['add_form' => $form, 'result' => $result]);
            }
        }

        return $this->render('car-add', ['add_form' => $form, 'result' => $result]);
    }

    public function createDirectory($path)
    {
        //$filename = "/folder/{$dirname}/";
        if (!file_exists($path)) {
            mkdir($path, 0775, true);
        }
    }

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
