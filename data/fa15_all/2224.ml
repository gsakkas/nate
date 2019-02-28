
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h t) then seen :: h else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h seen) then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,47)-(7,56)
seen
VarG

(7,47)-(7,56)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

(8,8)-(8,46)
seen
VarG

*)

(* changed exprs
Var (Just (7,39)-(7,43)) "seen"
ConApp (Just (7,50)-(7,59)) "::" (Just (Tuple (Just (7,50)-(7,59)) [Var (Just (7,50)-(7,51)) "h",Var (Just (7,55)-(7,59)) "seen"])) Nothing
Var (Just (7,65)-(7,69)) "seen"
*)

(* typed spans
(7,39)-(7,43)
(7,50)-(7,59)
(7,65)-(7,69)
*)

(* correct types
'a list
'a list
'a list
*)

(* bad types
'a list list
'a list list
'a list
*)
