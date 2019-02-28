
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h; seen) then h :: seen else seen in
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
(7,23)-(7,41)
List.mem h seen
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (7,23)-(7,38)) (Var (Just (7,23)-(7,31)) "List.mem") [Var (Just (7,32)-(7,33)) "h",Var (Just (7,34)-(7,38)) "seen"]
*)

(* typed spans
(7,23)-(7,38)
*)

(* correct types
bool
*)

(* bad types
unit list list -> bool
*)
