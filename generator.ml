open Printf

let actions = [
  "create_data_source_from_s3", "CreateDataSourceFromS3";
  "create_data_source_from_rds", "CreateDataSourceFromRDS";
  "create_data_source_from_redshift", "CreateDataSourceFromRedshift";
  "get_data_source", "GetDataSource";
  "update_data_source", "UpdateDataSource";
  "describe_data_sources", "DescribeDataSources";
  "delete_data_source", "DeleteDataSource";
  "create_ml_model", "CreateMLModel";
  "get_ml_model", "GetMLModel";
  "update_ml_model", "UpdateMLModel";
  "describe_ml_models", "DescribeMLModels";
  "delete_ml_model", "DeleteMLModel";
  "create_evaluation", "CreateEvaluation";
  "get_evaluation", "GetEvaluation";
  "update_evaluation", "UpdateEvaluation";
  "describe_evaluations", "DescribeEvaluations";
  "delete_evaluation", "DeleteEvaluation";
  "create_batch_prediction", "CreateBatchPrediction";
  "get_batch_prediction", "GetBatchPrediction";
  "update_batch_prediction", "UpdateBatchPrediction";
  "describe_batch_predictions", "DescribeBatchPredictions";
  "delete_batch_prediction", "DeleteBatchPrediction";
  "create_realtime_endpoint", "CreateRealtimeEndpoint";
  "delete_realtime_endpoint", "DeleteRealtimeEndpoint";
  "predict", "Predict";
]

let generate_signature (ocaml_ident, aws_ident) =
  printf "\
val %s :
  param ->
  Aws_ml_api_t.%s_req ->
  Aws_ml_api_t.%s_resp Lwt.t
  (** Call to %s *)

val opt_%s :
  param ->
  Aws_ml_api_t.%s_req ->
  Aws_ml_api_t.%s_resp option Lwt.t
  (** Call to %s.
      Not Found statuses (404) are treated
      as missing data, resulting in a None result. *)

"
    ocaml_ident ocaml_ident ocaml_ident
    aws_ident
    ocaml_ident ocaml_ident ocaml_ident
    aws_ident

let generate_implementation (ocaml_ident, aws_ident) =
  printf "\
let %s param req =
  post param \"%s\"
    Aws_ml_api_j.string_of_%s_req
    Aws_ml_api_j.%s_resp_of_string
    req

let opt_%s param req =
  opt_post param \"%s\"
    Aws_ml_api_j.string_of_%s_req
    Aws_ml_api_j.%s_resp_of_string
    req

"
    ocaml_ident aws_ident ocaml_ident ocaml_ident
    ocaml_ident aws_ident ocaml_ident ocaml_ident

let generate_app_implementation (ocaml_ident, aws_ident) =
  printf "\
let %s req =
  Cloudwatch.time \"aws.api.ml.%s\" (fun () ->
    Aws_ml_api.%s (get_ml_param ()) req
  )

let opt_%s req =
  Cloudwatch.time \"aws.api.ml.%s\" (fun () ->
    Aws_ml_api.opt_%s (get_ml_param ()) req
  )

"
    ocaml_ident ocaml_ident ocaml_ident
    ocaml_ident ocaml_ident ocaml_ident

let generate_mli () =
  printf "(* aws_ml_api.mli *)\n\n";
  List.iter generate_signature actions

let generate_ml () =
  printf "(* aws_ml_api.ml *)\n\n";
  List.iter generate_implementation actions

let generate_app_ml () =
  printf "(* aws_ml.ml *)\n\n";
  List.iter generate_app_implementation actions

let main () =
  generate_mli ();
  generate_ml ();
  generate_app_ml ()

let () = main ()
