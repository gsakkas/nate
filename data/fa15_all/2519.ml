
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, seen) then [] else seen @ h in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,41)
List.mem h seen
AppG (fromList [VarG])

(7,47)-(7,49)
seen
VarG

(7,62)-(7,63)
[h]
ListG VarG

*)

(* changed exprs
App (Just (7,23)-(7,38)) (Var (Just (7,23)-(7,31)) "List.mem") [Var (Just (7,32)-(7,33)) "h",Var (Just (7,34)-(7,38)) "seen"]
Var (Just (7,44)-(7,48)) "seen"
List (Just (7,61)-(7,64)) [Var (Just (7,62)-(7,63)) "h"] Nothing
*)

(* typed spans
(7,23)-(7,38)
(7,44)-(7,48)
(7,61)-(7,64)
*)

(* correct types
bool
'a list
'a list
*)

(* bad types
('a list * 'a list) list -> bool
'a list
'a list
*)
