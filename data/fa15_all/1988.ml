
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (sepConcat sep t)) in
      let base = t in
      let l = failwith "to be implemented" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = sep in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,19)
a
VarG

(6,29)-(6,46)
x
VarG

(7,17)-(7,18)
sep
VarG

(8,14)-(8,42)
t
VarG

*)

(* changed exprs
Var (Just (6,18)-(6,19)) "a"
Var (Just (6,29)-(6,30)) "x"
Var (Just (7,17)-(7,20)) "sep"
Var (Just (7,32)-(7,33)) "t"
*)

(* typed spans
(6,18)-(6,19)
(6,29)-(6,30)
(7,17)-(7,20)
(7,32)-(7,33)
*)

(* correct types
string
string
string
string list
*)

(* bad types
string
string
string list
'a
*)
