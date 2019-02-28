
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = [] in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,17)-(7,19)
h
VarG

(7,31)-(7,33)
t
VarG

*)

(* changed exprs
Var (Just (7,17)-(7,18)) "h"
Var (Just (7,30)-(7,31)) "t"
*)

(* typed spans
(7,17)-(7,18)
(7,30)-(7,31)
*)

(* correct types
string
string list
*)

(* bad types
'a list
'a list
*)
