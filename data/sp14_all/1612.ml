
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem (h, seen)) = false then seen @ [h] in
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
(7,23)-(7,43)
List.mem h seen
AppG (fromList [VarG])

(7,20)-(7,67)
seen
VarG

*)

(* changed exprs
App (Just (7,23)-(7,40)) (Var (Just (7,24)-(7,32)) "List.mem") [Var (Just (7,33)-(7,34)) "h",Var (Just (7,35)-(7,39)) "seen"]
Var (Just (7,70)-(7,74)) "seen"
*)

(* typed spans
(7,23)-(7,40)
(7,70)-(7,74)
*)

(* correct types
bool
'a list
*)

(* bad types
('a * 'a list) list -> bool
unit
*)
