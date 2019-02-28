
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (h ^ sep) ^ t in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (h ^ sep) ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,30)-(6,31)
x
VarG

*)

(* changed exprs
Var (Just (6,30)-(6,31)) "x"
*)

(* typed spans
(6,30)-(6,31)
*)

(* correct types
string
*)

(* bad types
string list
*)
