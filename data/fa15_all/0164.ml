
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h t) then true else false in
        let rest' = failwith "to be written" in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then [] :: seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,37)
List.mem h t
AppG (fromList [VarG])

(7,53)-(7,58)
[] :: seen
ConAppG (Just (TupleG (fromList [VarG,ListG EmptyG])))

(8,8)-(8,69)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

(8,20)-(8,44)
t
VarG

*)

(* changed exprs
App (Just (7,23)-(7,35)) (Var (Just (7,23)-(7,31)) "List.mem") [Var (Just (7,32)-(7,33)) "h",Var (Just (7,34)-(7,35)) "t"]
ConApp (Just (7,41)-(7,51)) "::" (Just (Tuple (Just (7,41)-(7,51)) [List (Just (7,41)-(7,43)) [] Nothing,Var (Just (7,47)-(7,51)) "seen"])) Nothing
ConApp (Just (7,57)-(7,66)) "::" (Just (Tuple (Just (7,57)-(7,66)) [Var (Just (7,57)-(7,58)) "h",Var (Just (7,62)-(7,66)) "seen"])) Nothing
Var (Just (8,20)-(8,21)) "t"
*)

(* typed spans
(7,23)-(7,35)
(7,41)-(7,51)
(7,57)-(7,66)
(8,20)-(8,21)
*)

(* correct types
bool
'a list list
'a list list
'a list list
*)

(* bad types
'a list -> bool
bool
bool
'a list
*)
