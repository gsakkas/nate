
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem = h) then h :: seen else seen in
        let rest' = [t] in helper (seen', rest') in
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
(7,27)-(7,41)
List.mem h seen
AppG (fromList [VarG])

(8,20)-(8,23)
t
VarG

*)

(* changed exprs
App (Just (7,27)-(7,44)) (Var (Just (7,28)-(7,36)) "List.mem") [Var (Just (7,37)-(7,38)) "h",Var (Just (7,39)-(7,43)) "seen"]
Var (Just (8,20)-(8,21)) "t"
*)

(* typed spans
(7,27)-(7,44)
(8,20)-(8,21)
*)

(* correct types
bool
'a list
*)

(* bad types
bool
'a -> 'a list -> bool list list
*)
