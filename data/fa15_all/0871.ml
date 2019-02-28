
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ t) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,19)
a
VarG

(6,29)-(6,30)
x
VarG

*)

(* changed exprs
Var (Just (6,18)-(6,19)) "a"
Var (Just (6,29)-(6,30)) "x"
*)

(* typed spans
(6,18)-(6,19)
(6,29)-(6,30)
*)

(* correct types
string
string
*)

(* bad types
string
string list
*)
