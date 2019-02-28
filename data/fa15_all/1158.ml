
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,46)
sl
VarG

*)

(* changed exprs
Var (Just (7,31)-(7,33)) "sl"
*)

(* typed spans
(7,31)-(7,33)
*)

(* correct types
string list
*)

(* bad types
'a list
*)
