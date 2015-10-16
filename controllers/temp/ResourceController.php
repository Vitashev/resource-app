<?php
namespace app\controllers;
use yii\rest\ActiveController;
use yii\data\ActiveDataProvider;
class ResourceController extends ActiveController
{
	public $modelClass = 'app\models\Resource';
	public $serializer = [ 'class' => 'yii\rest\Serializer', 'collectionEnvelope' => 'items'];

	public function behaviors()
	{
		return
			\yii\helpers\ArrayHelper::merge(parent::behaviors(), [
				'corsFilter' => [
					'class' => \yii\filters\Cors::className(),
				],
			]);
	}
	public function actionSearch()
	{
		$get = \Yii::$app->request->get();
		$model = new $this->modelClass;
		$query = $model::find();

		$query->andFilterWhere(['like', 'name', $get['name']]);
		$query->andFilterWhere(['like', 'class_id', $get['class_id']]);
		$dataProvider = new ActiveDataProvider([
			'query' => $query,
			'pagination' => [
				'pageSize' => 4,
				//'pageParam' => 'page',
			],
		]);

		return $dataProvider;
	}
}