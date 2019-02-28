
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [2] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,47)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

(8,8)-(8,46)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

*)

(* changed exprs
ConApp (Just (7,44)-(7,53)) "::" (Just (Tuple (Just (7,44)-(7,53)) [Var (Just (7,44)-(7,45)) "h",Var (Just (7,49)-(7,53)) "seen"])) Nothing
ConApp (Just (7,59)-(7,68)) "::" (Just (Tuple (Just (7,59)-(7,68)) [Var (Just (7,59)-(7,60)) "h",Var (Just (7,64)-(7,68)) "seen"])) Nothing
*)

(* typed spans
(7,44)-(7,53)
(7,59)-(7,68)
*)

(* correct types
'a list
'a list
*)

(* bad types
unit
'a list
*)
