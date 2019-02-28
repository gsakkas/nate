
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.rev (List.mem h t) then seen else h :: seen in
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
(7,23)-(7,46)
List.mem h t
AppG (fromList [VarG])

(9,2)-(9,16)
List.rev
VarG

(9,2)-(9,16)
helper ([] , l)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (7,23)-(7,35)) (Var (Just (7,23)-(7,31)) "List.mem") [Var (Just (7,32)-(7,33)) "h",Var (Just (7,34)-(7,35)) "t"]
Var (Just (9,2)-(9,10)) "List.rev"
App (Just (9,11)-(9,27)) (Var (Just (9,12)-(9,18)) "helper") [Tuple (Just (9,19)-(9,26)) [List (Just (9,20)-(9,22)) [] Nothing,Var (Just (9,24)-(9,25)) "l"]]
*)

(* typed spans
(7,23)-(7,35)
(9,2)-(9,10)
(9,11)-(9,27)
*)

(* correct types
bool
'a list -> 'a list
'a list
*)

(* bad types
bool
'a list
'a list
*)
