
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h "to be implemented" in
      let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,17)-(7,38)
h
VarG

*)

(* changed exprs
Var (Just (7,17)-(7,18)) "h"
*)

(* typed spans
(7,17)-(7,18)
*)

(* correct types
string
*)

(* bad types
string
*)
