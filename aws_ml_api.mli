(*
   Amazon Machine Learning client

   See documentation at
   http://docs.aws.amazon.com/machine-learning/latest/APIReference/Welcome.html
*)

type param = {
  access_key_id: string;
  secret_access_key: string;
  region: string; (* us-east-1 or eu-west-1 *)
}

(* Originally generated using `ocaml generator.ml` *)

val create_data_source_from_s3 :
  param ->
  Aws_ml_api_t.create_data_source_from_s3_req ->
  Aws_ml_api_t.create_data_source_from_s3_resp Lwt.t
  (** Call to CreateDataSourceFromS3 *)

val opt_create_data_source_from_s3 :
  param ->
  Aws_ml_api_t.create_data_source_from_s3_req ->
  Aws_ml_api_t.create_data_source_from_s3_resp option Lwt.t
  (** Call to CreateDataSourceFromS3.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val create_data_source_from_rds :
  param ->
  Aws_ml_api_t.create_data_source_from_rds_req ->
  Aws_ml_api_t.create_data_source_from_rds_resp Lwt.t
  (** Call to CreateDataSourceFromRDS *)

val opt_create_data_source_from_rds :
  param ->
  Aws_ml_api_t.create_data_source_from_rds_req ->
  Aws_ml_api_t.create_data_source_from_rds_resp option Lwt.t
  (** Call to CreateDataSourceFromRDS.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val create_data_source_from_redshift :
  param ->
  Aws_ml_api_t.create_data_source_from_redshift_req ->
  Aws_ml_api_t.create_data_source_from_redshift_resp Lwt.t
  (** Call to CreateDataSourceFromRedshift *)

val opt_create_data_source_from_redshift :
  param ->
  Aws_ml_api_t.create_data_source_from_redshift_req ->
  Aws_ml_api_t.create_data_source_from_redshift_resp option Lwt.t
  (** Call to CreateDataSourceFromRedshift.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val get_data_source :
  param ->
  Aws_ml_api_t.get_data_source_req ->
  Aws_ml_api_t.get_data_source_resp Lwt.t
  (** Call to GetDataSource *)

val opt_get_data_source :
  param ->
  Aws_ml_api_t.get_data_source_req ->
  Aws_ml_api_t.get_data_source_resp option Lwt.t
  (** Call to GetDataSource.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val update_data_source :
  param ->
  Aws_ml_api_t.update_data_source_req ->
  Aws_ml_api_t.update_data_source_resp Lwt.t
  (** Call to UpdateDataSource *)

val opt_update_data_source :
  param ->
  Aws_ml_api_t.update_data_source_req ->
  Aws_ml_api_t.update_data_source_resp option Lwt.t
  (** Call to UpdateDataSource.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val describe_data_sources :
  param ->
  Aws_ml_api_t.describe_data_sources_req ->
  Aws_ml_api_t.describe_data_sources_resp Lwt.t
  (** Call to DescribeDataSources *)

val opt_describe_data_sources :
  param ->
  Aws_ml_api_t.describe_data_sources_req ->
  Aws_ml_api_t.describe_data_sources_resp option Lwt.t
  (** Call to DescribeDataSources.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val delete_data_source :
  param ->
  Aws_ml_api_t.delete_data_source_req ->
  Aws_ml_api_t.delete_data_source_resp Lwt.t
  (** Call to DeleteDataSource *)

val opt_delete_data_source :
  param ->
  Aws_ml_api_t.delete_data_source_req ->
  Aws_ml_api_t.delete_data_source_resp option Lwt.t
  (** Call to DeleteDataSource.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val create_ml_model :
  param ->
  Aws_ml_api_t.create_ml_model_req ->
  Aws_ml_api_t.create_ml_model_resp Lwt.t
  (** Call to CreateMLModel *)

val opt_create_ml_model :
  param ->
  Aws_ml_api_t.create_ml_model_req ->
  Aws_ml_api_t.create_ml_model_resp option Lwt.t
  (** Call to CreateMLModel.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val get_ml_model :
  param ->
  Aws_ml_api_t.get_ml_model_req ->
  Aws_ml_api_t.get_ml_model_resp Lwt.t
  (** Call to GetMLModel *)

val opt_get_ml_model :
  param ->
  Aws_ml_api_t.get_ml_model_req ->
  Aws_ml_api_t.get_ml_model_resp option Lwt.t
  (** Call to GetMLModel.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val update_ml_model :
  param ->
  Aws_ml_api_t.update_ml_model_req ->
  Aws_ml_api_t.update_ml_model_resp Lwt.t
  (** Call to UpdateMLModel *)

val opt_update_ml_model :
  param ->
  Aws_ml_api_t.update_ml_model_req ->
  Aws_ml_api_t.update_ml_model_resp option Lwt.t
  (** Call to UpdateMLModel.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val describe_ml_models :
  param ->
  Aws_ml_api_t.describe_ml_models_req ->
  Aws_ml_api_t.describe_ml_models_resp Lwt.t
  (** Call to DescribeMLModels *)

val opt_describe_ml_models :
  param ->
  Aws_ml_api_t.describe_ml_models_req ->
  Aws_ml_api_t.describe_ml_models_resp option Lwt.t
  (** Call to DescribeMLModels.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val delete_ml_model :
  param ->
  Aws_ml_api_t.delete_ml_model_req ->
  Aws_ml_api_t.delete_ml_model_resp Lwt.t
  (** Call to DeleteMLModel *)

val opt_delete_ml_model :
  param ->
  Aws_ml_api_t.delete_ml_model_req ->
  Aws_ml_api_t.delete_ml_model_resp option Lwt.t
  (** Call to DeleteMLModel.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val create_evaluation :
  param ->
  Aws_ml_api_t.create_evaluation_req ->
  Aws_ml_api_t.create_evaluation_resp Lwt.t
  (** Call to CreateEvaluation *)

val opt_create_evaluation :
  param ->
  Aws_ml_api_t.create_evaluation_req ->
  Aws_ml_api_t.create_evaluation_resp option Lwt.t
  (** Call to CreateEvaluation.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val get_evaluation :
  param ->
  Aws_ml_api_t.get_evaluation_req ->
  Aws_ml_api_t.get_evaluation_resp Lwt.t
  (** Call to GetEvaluation *)

val opt_get_evaluation :
  param ->
  Aws_ml_api_t.get_evaluation_req ->
  Aws_ml_api_t.get_evaluation_resp option Lwt.t
  (** Call to GetEvaluation.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val update_evaluation :
  param ->
  Aws_ml_api_t.update_evaluation_req ->
  Aws_ml_api_t.update_evaluation_resp Lwt.t
  (** Call to UpdateEvaluation *)

val opt_update_evaluation :
  param ->
  Aws_ml_api_t.update_evaluation_req ->
  Aws_ml_api_t.update_evaluation_resp option Lwt.t
  (** Call to UpdateEvaluation.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val describe_evaluations :
  param ->
  Aws_ml_api_t.describe_evaluations_req ->
  Aws_ml_api_t.describe_evaluations_resp Lwt.t
  (** Call to DescribeEvaluations *)

val opt_describe_evaluations :
  param ->
  Aws_ml_api_t.describe_evaluations_req ->
  Aws_ml_api_t.describe_evaluations_resp option Lwt.t
  (** Call to DescribeEvaluations.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val delete_evaluation :
  param ->
  Aws_ml_api_t.delete_evaluation_req ->
  Aws_ml_api_t.delete_evaluation_resp Lwt.t
  (** Call to DeleteEvaluation *)

val opt_delete_evaluation :
  param ->
  Aws_ml_api_t.delete_evaluation_req ->
  Aws_ml_api_t.delete_evaluation_resp option Lwt.t
  (** Call to DeleteEvaluation.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val create_batch_prediction :
  param ->
  Aws_ml_api_t.create_batch_prediction_req ->
  Aws_ml_api_t.create_batch_prediction_resp Lwt.t
  (** Call to CreateBatchPrediction *)

val opt_create_batch_prediction :
  param ->
  Aws_ml_api_t.create_batch_prediction_req ->
  Aws_ml_api_t.create_batch_prediction_resp option Lwt.t
  (** Call to CreateBatchPrediction.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val get_batch_prediction :
  param ->
  Aws_ml_api_t.get_batch_prediction_req ->
  Aws_ml_api_t.get_batch_prediction_resp Lwt.t
  (** Call to GetBatchPrediction *)

val opt_get_batch_prediction :
  param ->
  Aws_ml_api_t.get_batch_prediction_req ->
  Aws_ml_api_t.get_batch_prediction_resp option Lwt.t
  (** Call to GetBatchPrediction.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val update_batch_prediction :
  param ->
  Aws_ml_api_t.update_batch_prediction_req ->
  Aws_ml_api_t.update_batch_prediction_resp Lwt.t
  (** Call to UpdateBatchPrediction *)

val opt_update_batch_prediction :
  param ->
  Aws_ml_api_t.update_batch_prediction_req ->
  Aws_ml_api_t.update_batch_prediction_resp option Lwt.t
  (** Call to UpdateBatchPrediction.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val describe_batch_predictions :
  param ->
  Aws_ml_api_t.describe_batch_predictions_req ->
  Aws_ml_api_t.describe_batch_predictions_resp Lwt.t
  (** Call to DescribeBatchPredictions *)

val opt_describe_batch_predictions :
  param ->
  Aws_ml_api_t.describe_batch_predictions_req ->
  Aws_ml_api_t.describe_batch_predictions_resp option Lwt.t
  (** Call to DescribeBatchPredictions.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val delete_batch_prediction :
  param ->
  Aws_ml_api_t.delete_batch_prediction_req ->
  Aws_ml_api_t.delete_batch_prediction_resp Lwt.t
  (** Call to DeleteBatchPrediction *)

val opt_delete_batch_prediction :
  param ->
  Aws_ml_api_t.delete_batch_prediction_req ->
  Aws_ml_api_t.delete_batch_prediction_resp option Lwt.t
  (** Call to DeleteBatchPrediction.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val create_realtime_endpoint :
  param ->
  Aws_ml_api_t.create_realtime_endpoint_req ->
  Aws_ml_api_t.create_realtime_endpoint_resp Lwt.t
  (** Call to CreateRealtimeEndpoint *)

val opt_create_realtime_endpoint :
  param ->
  Aws_ml_api_t.create_realtime_endpoint_req ->
  Aws_ml_api_t.create_realtime_endpoint_resp option Lwt.t
  (** Call to CreateRealtimeEndpoint.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val delete_realtime_endpoint :
  param ->
  Aws_ml_api_t.delete_realtime_endpoint_req ->
  Aws_ml_api_t.delete_realtime_endpoint_resp Lwt.t
  (** Call to DeleteRealtimeEndpoint *)

val opt_delete_realtime_endpoint :
  param ->
  Aws_ml_api_t.delete_realtime_endpoint_req ->
  Aws_ml_api_t.delete_realtime_endpoint_resp option Lwt.t
  (** Call to DeleteRealtimeEndpoint.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

val predict :
  param ->
  Aws_ml_api_t.predict_req ->
  Aws_ml_api_t.predict_resp Lwt.t
  (** Call to Predict *)

val opt_predict :
  param ->
  Aws_ml_api_t.predict_req ->
  Aws_ml_api_t.predict_resp option Lwt.t
  (** Call to Predict.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)
