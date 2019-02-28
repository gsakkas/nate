
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (sepConcat sep a) @ x in
      let base = [] in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,35)
(^)
VarG

(6,38)-(6,39)
sep
VarG

(7,17)-(7,19)
h
VarG

*)

(* changed exprs
Var (Just (6,20)-(6,21)) "^"
Var (Just (6,22)-(6,25)) "sep"
Var (Just (7,17)-(7,18)) "h"
*)

(* typed spans
(6,20)-(6,21)
(6,22)-(6,25)
(7,17)-(7,18)
*)

(* correct types
string -> string -> string
string
string
*)

(* bad types
'a list
'a list
'a list
*)
