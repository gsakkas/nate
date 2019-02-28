
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then [] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,43)
seen
VarG

(8,8)-(8,46)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

(8,8)-(8,46)
seen
VarG

*)

(* changed exprs
Var (Just (7,34)-(7,38)) "seen"
ConApp (Just (7,44)-(7,53)) "::" (Just (Tuple (Just (7,44)-(7,53)) [Var (Just (7,44)-(7,45)) "h",Var (Just (7,49)-(7,53)) "seen"])) Nothing
Var (Just (7,59)-(7,63)) "seen"
*)

(* typed spans
(7,34)-(7,38)
(7,44)-(7,53)
(7,59)-(7,63)
*)

(* correct types
'a list
'a list
'a list
*)

(* bad types
unit
unit
unit
*)
