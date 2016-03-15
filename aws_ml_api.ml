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
      ~secret_access_key: param.secret_access_key
      ~content_type: Aws_call.json_content_type
      ~target: ("AmazonML_20141212." ^ action)
      ~http_request_method: "POST"
      ~host
      ~region
      ~service
      ~path: "/"
      ~request_payload
      ()
  in
  url, headers

let opt_post param action req_to_string resp_of_string request =
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
      logf `Error "Bad AWS ML request. Response body: %s" body;
      failwith "Bad AWS request"
  | err, _, body ->
      logf `Error "AWS ML call failed with error %d: %s\n%!"
        (Cohttp.Code.code_of_status err) body;
      Http_exn.service_unavailable "3rd-party service is unavailable"

let post param action req_to_string resp_of_string request =
  opt_post param action req_to_string resp_of_string request >>= function
  | Some x -> return x
  | None -> Http_exn.not_found "AWS ML resource not found"

let get_ml_model param x =
  post param "GetMLModel"
    Aws_ml_api_j.string_of_get_ml_model_req
    Aws_ml_api_j.get_ml_model_resp_of_string
    x
