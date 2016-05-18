(*
   Amazon Machine Learning client
*)

open Printf
open Lwt
open Log
open Aws_ml_api_t

let service = "machinelearning"

type param = {
  access_key_id: string;
  secret_access_key: string;
  region: string; (* us-east-1 or eu-west-1 *)
}

let make_url_and_headers ~param ~action ~request_payload =
  let region = param.region in
  let host = sprintf "%s.%s.amazonaws.com" service region in
  let path = "/" in
  let url = sprintf "https://%s%s" host path in
  let headers =
    Aws_call.make_headers
      ~access_key_id: param.access_key_id
      ~secret_access_key: param.secret_access_key
      ~content_type: Aws_call.json_content_type
      ~target: ("AmazonML_20141212." ^ action)
      ~http_request_method: `POST
      ~host
      ~region
      ~service
      ~path: "/"
      ~request_payload
      ()
  in
  url, headers

let rec opt_post
    ?(delay_before_retrying = 1)
    param action req_to_string resp_of_string request =
  let request_payload = req_to_string request in
  let url, headers = make_url_and_headers ~param ~action ~request_payload in
  Util_http_client.post
    ~headers ~body:request_payload
    (Uri.of_string url)
  >>= function
  | `OK, headers, body ->
      return (Some (resp_of_string body))
  | `Not_found, _, _ ->
      return None
  | `Bad_request, _, body ->
      let x = Aws_ml_api_j.error_response_of_string body in
      (match x.error_type_ with
       | "ResourceNotFoundException" ->
           return None
       | "ThrottlingException" when delay_before_retrying <= 16 ->
           logf `Warning
             "ThrottlingException: Retrying AWS ML request in %i seconds"
             delay_before_retrying;
           Lwt_unix.sleep (float delay_before_retrying) >>= fun () ->
           opt_post
             ~delay_before_retrying: (2 * delay_before_retrying)
             param action req_to_string resp_of_string request
       | _ ->
           logf `Error "Bad AWS ML request. Response body: %s" body;
           failwith "Bad AWS ML request"
      )
  | err, _, body ->
      logf `Error "AWS ML call failed with error %d: %s\n%!"
        (Cohttp.Code.code_of_status err) body;
      Http_exn.service_unavailable "3rd-party service is unavailable"

let post param action req_to_string resp_of_string request =
  opt_post param action req_to_string resp_of_string request >>= function
  | Some x -> return x
  | None ->
      Http_exn.not_found
        `Not_found
        "AWS ML resource not found"

(* Originally generated using `ocaml generator.ml` *)

let create_data_source_from_s3 param req =
  post param "CreateDataSourceFromS3"
    Aws_ml_api_j.string_of_create_data_source_from_s3_req
    Aws_ml_api_j.create_data_source_from_s3_resp_of_string
    req

let opt_create_data_source_from_s3 param req =
  opt_post param "CreateDataSourceFromS3"
    Aws_ml_api_j.string_of_create_data_source_from_s3_req
    Aws_ml_api_j.create_data_source_from_s3_resp_of_string
    req

let create_data_source_from_rds param req =
  post param "CreateDataSourceFromRDS"
    Aws_ml_api_j.string_of_create_data_source_from_rds_req
    Aws_ml_api_j.create_data_source_from_rds_resp_of_string
    req

let opt_create_data_source_from_rds param req =
  opt_post param "CreateDataSourceFromRDS"
    Aws_ml_api_j.string_of_create_data_source_from_rds_req
    Aws_ml_api_j.create_data_source_from_rds_resp_of_string
    req

let create_data_source_from_redshift param req =
  post param "CreateDataSourceFromRedshift"
    Aws_ml_api_j.string_of_create_data_source_from_redshift_req
    Aws_ml_api_j.create_data_source_from_redshift_resp_of_string
    req

let opt_create_data_source_from_redshift param req =
  opt_post param "CreateDataSourceFromRedshift"
    Aws_ml_api_j.string_of_create_data_source_from_redshift_req
    Aws_ml_api_j.create_data_source_from_redshift_resp_of_string
    req

let get_data_source param req =
  post param "GetDataSource"
    Aws_ml_api_j.string_of_get_data_source_req
    Aws_ml_api_j.get_data_source_resp_of_string
    req

let opt_get_data_source param req =
  opt_post param "GetDataSource"
    Aws_ml_api_j.string_of_get_data_source_req
    Aws_ml_api_j.get_data_source_resp_of_string
    req

let update_data_source param req =
  post param "UpdateDataSource"
    Aws_ml_api_j.string_of_update_data_source_req
    Aws_ml_api_j.update_data_source_resp_of_string
    req

let opt_update_data_source param req =
  opt_post param "UpdateDataSource"
    Aws_ml_api_j.string_of_update_data_source_req
    Aws_ml_api_j.update_data_source_resp_of_string
    req

let describe_data_sources param req =
  post param "DescribeDataSources"
    Aws_ml_api_j.string_of_describe_data_sources_req
    Aws_ml_api_j.describe_data_sources_resp_of_string
    req

let opt_describe_data_sources param req =
  opt_post param "DescribeDataSources"
    Aws_ml_api_j.string_of_describe_data_sources_req
    Aws_ml_api_j.describe_data_sources_resp_of_string
    req

let delete_data_source param req =
  post param "DeleteDataSource"
    Aws_ml_api_j.string_of_delete_data_source_req
    Aws_ml_api_j.delete_data_source_resp_of_string
    req

let opt_delete_data_source param req =
  opt_post param "DeleteDataSource"
    Aws_ml_api_j.string_of_delete_data_source_req
    Aws_ml_api_j.delete_data_source_resp_of_string
    req

let create_ml_model param req =
  post param "CreateMLModel"
    Aws_ml_api_j.string_of_create_ml_model_req
    Aws_ml_api_j.create_ml_model_resp_of_string
    req

let opt_create_ml_model param req =
  opt_post param "CreateMLModel"
    Aws_ml_api_j.string_of_create_ml_model_req
    Aws_ml_api_j.create_ml_model_resp_of_string
    req

let get_ml_model param req =
  post param "GetMLModel"
    Aws_ml_api_j.string_of_get_ml_model_req
    Aws_ml_api_j.get_ml_model_resp_of_string
    req

let opt_get_ml_model param req =
  opt_post param "GetMLModel"
    Aws_ml_api_j.string_of_get_ml_model_req
    Aws_ml_api_j.get_ml_model_resp_of_string
    req

let update_ml_model param req =
  post param "UpdateMLModel"
    Aws_ml_api_j.string_of_update_ml_model_req
    Aws_ml_api_j.update_ml_model_resp_of_string
    req

let opt_update_ml_model param req =
  opt_post param "UpdateMLModel"
    Aws_ml_api_j.string_of_update_ml_model_req
    Aws_ml_api_j.update_ml_model_resp_of_string
    req

let describe_ml_models param req =
  post param "DescribeMLModels"
    Aws_ml_api_j.string_of_describe_ml_models_req
    Aws_ml_api_j.describe_ml_models_resp_of_string
    req

let opt_describe_ml_models param req =
  opt_post param "DescribeMLModels"
    Aws_ml_api_j.string_of_describe_ml_models_req
    Aws_ml_api_j.describe_ml_models_resp_of_string
    req

let delete_ml_model param req =
  post param "DeleteMLModel"
    Aws_ml_api_j.string_of_delete_ml_model_req
    Aws_ml_api_j.delete_ml_model_resp_of_string
    req

let opt_delete_ml_model param req =
  opt_post param "DeleteMLModel"
    Aws_ml_api_j.string_of_delete_ml_model_req
    Aws_ml_api_j.delete_ml_model_resp_of_string
    req

let create_evaluation param req =
  post param "CreateEvaluation"
    Aws_ml_api_j.string_of_create_evaluation_req
    Aws_ml_api_j.create_evaluation_resp_of_string
    req

let opt_create_evaluation param req =
  opt_post param "CreateEvaluation"
    Aws_ml_api_j.string_of_create_evaluation_req
    Aws_ml_api_j.create_evaluation_resp_of_string
    req

let get_evaluation param req =
  post param "GetEvaluation"
    Aws_ml_api_j.string_of_get_evaluation_req
    Aws_ml_api_j.get_evaluation_resp_of_string
    req

let opt_get_evaluation param req =
  opt_post param "GetEvaluation"
    Aws_ml_api_j.string_of_get_evaluation_req
    Aws_ml_api_j.get_evaluation_resp_of_string
    req

let update_evaluation param req =
  post param "UpdateEvaluation"
    Aws_ml_api_j.string_of_update_evaluation_req
    Aws_ml_api_j.update_evaluation_resp_of_string
    req

let opt_update_evaluation param req =
  opt_post param "UpdateEvaluation"
    Aws_ml_api_j.string_of_update_evaluation_req
    Aws_ml_api_j.update_evaluation_resp_of_string
    req

let describe_evaluations param req =
  post param "DescribeEvaluations"
    Aws_ml_api_j.string_of_describe_evaluations_req
    Aws_ml_api_j.describe_evaluations_resp_of_string
    req

let opt_describe_evaluations param req =
  opt_post param "DescribeEvaluations"
    Aws_ml_api_j.string_of_describe_evaluations_req
    Aws_ml_api_j.describe_evaluations_resp_of_string
    req

let delete_evaluation param req =
  post param "DeleteEvaluation"
    Aws_ml_api_j.string_of_delete_evaluation_req
    Aws_ml_api_j.delete_evaluation_resp_of_string
    req

let opt_delete_evaluation param req =
  opt_post param "DeleteEvaluation"
    Aws_ml_api_j.string_of_delete_evaluation_req
    Aws_ml_api_j.delete_evaluation_resp_of_string
    req

let create_batch_prediction param req =
  post param "CreateBatchPrediction"
    Aws_ml_api_j.string_of_create_batch_prediction_req
    Aws_ml_api_j.create_batch_prediction_resp_of_string
    req

let opt_create_batch_prediction param req =
  opt_post param "CreateBatchPrediction"
    Aws_ml_api_j.string_of_create_batch_prediction_req
    Aws_ml_api_j.create_batch_prediction_resp_of_string
    req

let get_batch_prediction param req =
  post param "GetBatchPrediction"
    Aws_ml_api_j.string_of_get_batch_prediction_req
    Aws_ml_api_j.get_batch_prediction_resp_of_string
    req

let opt_get_batch_prediction param req =
  opt_post param "GetBatchPrediction"
    Aws_ml_api_j.string_of_get_batch_prediction_req
    Aws_ml_api_j.get_batch_prediction_resp_of_string
    req

let update_batch_prediction param req =
  post param "UpdateBatchPrediction"
    Aws_ml_api_j.string_of_update_batch_prediction_req
    Aws_ml_api_j.update_batch_prediction_resp_of_string
    req

let opt_update_batch_prediction param req =
  opt_post param "UpdateBatchPrediction"
    Aws_ml_api_j.string_of_update_batch_prediction_req
    Aws_ml_api_j.update_batch_prediction_resp_of_string
    req

let describe_batch_predictions param req =
  post param "DescribeBatchPredictions"
    Aws_ml_api_j.string_of_describe_batch_predictions_req
    Aws_ml_api_j.describe_batch_predictions_resp_of_string
    req

let opt_describe_batch_predictions param req =
  opt_post param "DescribeBatchPredictions"
    Aws_ml_api_j.string_of_describe_batch_predictions_req
    Aws_ml_api_j.describe_batch_predictions_resp_of_string
    req

let delete_batch_prediction param req =
  post param "DeleteBatchPrediction"
    Aws_ml_api_j.string_of_delete_batch_prediction_req
    Aws_ml_api_j.delete_batch_prediction_resp_of_string
    req

let opt_delete_batch_prediction param req =
  opt_post param "DeleteBatchPrediction"
    Aws_ml_api_j.string_of_delete_batch_prediction_req
    Aws_ml_api_j.delete_batch_prediction_resp_of_string
    req

let create_realtime_endpoint param req =
  post param "CreateRealtimeEndpoint"
    Aws_ml_api_j.string_of_create_realtime_endpoint_req
    Aws_ml_api_j.create_realtime_endpoint_resp_of_string
    req

let opt_create_realtime_endpoint param req =
  opt_post param "CreateRealtimeEndpoint"
    Aws_ml_api_j.string_of_create_realtime_endpoint_req
    Aws_ml_api_j.create_realtime_endpoint_resp_of_string
    req

let delete_realtime_endpoint param req =
  post param "DeleteRealtimeEndpoint"
    Aws_ml_api_j.string_of_delete_realtime_endpoint_req
    Aws_ml_api_j.delete_realtime_endpoint_resp_of_string
    req

let opt_delete_realtime_endpoint param req =
  opt_post param "DeleteRealtimeEndpoint"
    Aws_ml_api_j.string_of_delete_realtime_endpoint_req
    Aws_ml_api_j.delete_realtime_endpoint_resp_of_string
    req

let predict param req =
  post param "Predict"
    Aws_ml_api_j.string_of_predict_req
    Aws_ml_api_j.predict_resp_of_string
    req

let opt_predict param req =
  opt_post param "Predict"
    Aws_ml_api_j.string_of_predict_req
    Aws_ml_api_j.predict_resp_of_string
    req
