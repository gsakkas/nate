
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h seen) then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,38)
not (List.mem h seen)
AppG (fromList [AppG (fromList [EmptyG])])

(7,20)-(7,54)
seen
VarG

*)

(* changed exprs
App (Just (7,23)-(7,44)) (Var (Just (7,23)-(7,26)) "not") [App (Just (7,27)-(7,44)) (Var (Just (7,28)-(7,36)) "List.mem") [Var (Just (7,37)-(7,38)) "h",Var (Just (7,39)-(7,43)) "seen"]]
Var (Just (7,66)-(7,70)) "seen"
*)

(* typed spans
(7,23)-(7,44)
(7,66)-(7,70)
*)

(* correct types
bool
'a list
*)

(* bad types
bool
unit
*)
