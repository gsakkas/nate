
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem seen h then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,38)
List.mem h seen = false
BopG (AppG (fromList [EmptyG])) LitG

*)

(* changed exprs
Bop (Just (7,23)-(7,48)) Eq (App (Just (7,23)-(7,40)) (Var (Just (7,24)-(7,32)) "List.mem") [Var (Just (7,33)-(7,34)) "h",Var (Just (7,35)-(7,39)) "seen"]) (Lit (Just (7,43)-(7,48)) (LB False))
*)

(* typed spans
(7,23)-(7,48)
*)

(* correct types
bool
*)

(* bad types
bool
*)
