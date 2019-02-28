
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else [seen; h] in
        let rest' = t in helper (seen', rest') in
  helper ([], l);;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,51)-(7,60)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

(9,2)-(9,8)
List.rev
VarG

(9,2)-(9,8)
helper ([] , l)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
ConApp (Just (7,51)-(7,60)) "::" (Just (Tuple (Just (7,51)-(7,60)) [Var (Just (7,51)-(7,52)) "h",Var (Just (7,56)-(7,60)) "seen"])) Nothing
Var (Just (9,2)-(9,10)) "List.rev"
App (Just (9,11)-(9,27)) (Var (Just (9,12)-(9,18)) "helper") [Tuple (Just (9,19)-(9,26)) [List (Just (9,20)-(9,22)) [] Nothing,Var (Just (9,24)-(9,25)) "l"]]
*)

(* typed spans
(7,51)-(7,60)
(9,2)-(9,10)
(9,11)-(9,27)
*)

(* correct types
'a list
'a list -> 'a list
'a list
*)

(* bad types
'a list
('a list * 'a list) -> 'a
('a list * 'a list) -> 'a
*)
