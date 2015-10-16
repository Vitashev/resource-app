<?php
namespace app\controllers;
use yii\rest\ActiveController;
use yii\data\ActiveDataProvider;
use app\models\Resource;
use app\models\PersonalData;
use app\models\ResourceClass;
use app\models\Parameter;
use app\models\ResourceAttribute;
class ResourceController extends ActiveController
{
	public $modelClass = 'app\models\Resource';
	public $serializer = [ 'class' => 'yii\rest\Serializer', 'collectionEnvelope' => 'items'];


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

	public function actionExport($id)
	{
		$filepath = dirname(__FILE__) . '/../runtime/result.docx';
		$template_filepath = dirname(__FILE__)
			. '/../runtime/templates/Template.docx';

		if (file_exists($template_filepath)) {

			$resource = Resource::findOne($id);

			$filename = $resource->name. '.docx';

			$coordinates = json_decode($resource->coordinates);

			$owner = PersonalData::findOne($resource->owner_data_id);
			$owner_name = $owner->last_name. ' ' . $owner->first_name. ' ' . $owner->middle_name;

			$resource_class = ResourceClass::findOne($resource->class_id)->name;

			$parameters = Parameter::find()
				->where(['resource_id' => $id])
				->all();

			$attributes = [];

			foreach ($parameters as $parameter) {
				$parameter_name = ResourceAttribute::findOne($parameter->attribute_id);
				$attributes[$parameter_name->name] = $parameter->value;
			}

			$linear_size = $attributes['length'];

			if ($attributes['width']) {
				$linear_size .= ':'. $attributes['width'];
			}
			if ($attributes['height']) {
				$linear_size .= ':'. $attributes['height'];
			}

			\PhpOffice\PhpWord\Autoloader::register();
			$templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($template_filepath);

			// Template processing
			$templateProcessor->setValue('name', htmlspecialchars($resource->name, ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('class', htmlspecialchars($resource_class, ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('subclass', htmlspecialchars($subclass, ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('owner', htmlspecialchars($owner_name, ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('linear_size', htmlspecialchars($linear_size, ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('area', htmlspecialchars($attributes['square'], ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('weight', htmlspecialchars($attributes['weight'], ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('perimeter', htmlspecialchars($attributes['perimeter'], ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('volume', htmlspecialchars($attributes['volume'], ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('reason', htmlspecialchars($reason, ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('registrar', htmlspecialchars($registrar, ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('registrar_address', htmlspecialchars($registrar, ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('registration_number', htmlspecialchars($registration_number, ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('registration_date', htmlspecialchars($creation_date, ENT_COMPAT, 'UTF-8'));
			$templateProcessor->setValue('registrar_shortname', htmlspecialchars($registrar_short_name, ENT_COMPAT, 'UTF-8'));

			for ($i=1; $i <= 20 ; $i++)
			{
				$lat = "";
				$lng = "";
				if (count($coordinates) >= $i)
				{
					$lat = $coordinates[$i - 1][0];
					$lng = $coordinates[$i - 1][1];
				}
				$templateProcessor->setValue('lat#'. $i, htmlspecialchars($lat, ENT_COMPAT, 'UTF-8'));
				$templateProcessor->setValue('lng#'. $i, htmlspecialchars($lng, ENT_COMPAT, 'UTF-8'));
			}

			// Saving the document as OOXML file...
			$templateProcessor->saveAs($filepath);

			if(file_exists($filepath))
			{
				return \Yii::$app->response->sendFile($filepath, $filename, ['inline' => false])->send();
			}
		}
	}


	public function checkAccess($action, $model = null, $params = [])
	{
		\Yii::$app->authcomponent->checkPermissions($action,\Yii::$app->authcomponent->write);
		//\Yii::$app->authcomponent->checkPermissionsPrivateData($action,\Yii::$app->authcomponent->read);
		/*  exit('es');
          exit($action);
          if ($action == 'create' || $action == 'update' || $action || 'delete'){
              if(!(\Yii::$app->session->get('role') == 'register')) {
                  exit('1');
              }
          }*/
	}
}