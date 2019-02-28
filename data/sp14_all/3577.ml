
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ x in
      let base = (^) h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,21)
a
VarG

(6,18)-(6,21)
sep ^ x
AppG (fromList [VarG])

(7,17)-(7,22)
h
VarG

*)

(* changed exprs
Var (Just (6,18)-(6,19)) "a"
App (Just (6,22)-(6,31)) (Var (Just (6,27)-(6,28)) "^") [Var (Just (6,23)-(6,26)) "sep",Var (Just (6,29)-(6,30)) "x"]
Var (Just (7,17)-(7,18)) "h"
*)

(* typed spans
(6,18)-(6,19)
(6,22)-(6,31)
(7,17)-(7,18)
*)

(* correct types
string
string
string
*)

(* bad types
string
string
string -> string
*)
