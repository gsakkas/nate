
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [seen; h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,54)-(7,63)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

(8,8)-(8,46)
seen
VarG

*)

(* changed exprs
ConApp (Just (7,54)-(7,63)) "::" (Just (Tuple (Just (7,54)-(7,63)) [Var (Just (7,54)-(7,55)) "h",Var (Just (7,59)-(7,63)) "seen"])) Nothing
Var (Just (7,69)-(7,73)) "seen"
*)

(* typed spans
(7,54)-(7,63)
(7,69)-(7,73)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list list
'a list
*)
