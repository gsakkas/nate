
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not List.mem h l then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h l) then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,39)
not (List.mem h l)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (7,23)-(7,41)) (Var (Just (7,23)-(7,26)) "not") [App (Just (7,27)-(7,41)) (Var (Just (7,28)-(7,36)) "List.mem") [Var (Just (7,37)-(7,38)) "h",Var (Just (7,39)-(7,40)) "l"]]
*)

(* typed spans
(7,23)-(7,41)
*)

(* correct types
bool
*)

(* bad types
bool
*)
