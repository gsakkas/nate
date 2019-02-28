
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen :: h in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,44)-(7,53)
seen @ [h]
AppG (fromList [VarG,ListG EmptyG])

(7,20)-(7,53)
seen
VarG

*)

(* changed exprs
App (Just (7,44)-(7,54)) (Var (Just (7,49)-(7,50)) "@") [Var (Just (7,44)-(7,48)) "seen",List (Just (7,51)-(7,54)) [Var (Just (7,52)-(7,53)) "h"] Nothing]
Var (Just (7,60)-(7,64)) "seen"
*)

(* typed spans
(7,44)-(7,54)
(7,60)-(7,64)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list list
unit
*)
