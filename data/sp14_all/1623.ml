
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h @ seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [h] @ seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,38)
List.mem h seen = false
BopG (AppG (fromList [EmptyG])) LitG

(7,44)-(7,45)
[h]
ListG VarG

(7,20)-(7,52)
seen
VarG

*)

(* changed exprs
Bop (Just (7,23)-(7,48)) Eq (App (Just (7,23)-(7,40)) (Var (Just (7,24)-(7,32)) "List.mem") [Var (Just (7,33)-(7,34)) "h",Var (Just (7,35)-(7,39)) "seen"]) (Lit (Just (7,43)-(7,48)) (LB False))
List (Just (7,54)-(7,57)) [Var (Just (7,55)-(7,56)) "h"] Nothing
Var (Just (7,70)-(7,74)) "seen"
*)

(* typed spans
(7,23)-(7,48)
(7,54)-(7,57)
(7,70)-(7,74)
*)

(* correct types
bool
'a list
'a list
*)

(* bad types
bool
'a list
unit
*)
