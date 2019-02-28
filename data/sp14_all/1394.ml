
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,23)
x
VarG

(7,30)-(7,32)
t
VarG

*)

(* changed exprs
Var (Just (6,18)-(6,19)) "x"
Var (Just (6,47)-(6,48)) "t"
*)

(* typed spans
(6,18)-(6,19)
(6,47)-(6,48)
*)

(* correct types
string
string list
*)

(* bad types
string
string
*)
