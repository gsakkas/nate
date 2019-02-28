
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (a t)) in
      let base = h in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,29)-(6,34)
a
VarG

(7,30)-(7,32)
t
VarG

*)

(* changed exprs
Var (Just (6,29)-(6,30)) "a"
Var (Just (7,30)-(7,31)) "t"
*)

(* typed spans
(6,29)-(6,30)
(7,30)-(7,31)
*)

(* correct types
string
string list
*)

(* bad types
string
string list
*)
