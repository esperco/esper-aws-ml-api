(*
   Amazon Machine Learning client
*)

open Printf

type param = {
  access_key_id: string;
  secret_access_key: string;
  region: string; (* us-east-1 or eu-west-1 *)
}

let make_headers ~action_name () =
  Aws_call.make_headers
    ~content_type: Aws_call.json_content_type
    ~target: ("AmazonML_20141212." ^ action_name)
    ()

let make_url ~region =
  sprintf "https://machinelearning.%s.amazonaws.com/" region

(*
let post param action_name json_payload =
  let url = make_url ~region:param.region in
  let headers = make_headers ~action_name () in
  Util_http_client.post ~headers ~body:json_payload
*)
