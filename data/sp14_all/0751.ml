
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev helper ([], l);;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(9,2)-(9,25)
List.rev (helper ([] , l))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (9,2)-(9,27)) (Var (Just (9,2)-(9,10)) "List.rev") [App (Just (9,11)-(9,27)) (Var (Just (9,12)-(9,18)) "helper") [Tuple (Just (9,19)-(9,26)) [List (Just (9,20)-(9,22)) [] Nothing,Var (Just (9,24)-(9,25)) "l"]]]
*)

(* typed spans
(9,2)-(9,27)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
