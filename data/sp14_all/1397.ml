
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,30)-(7,32)
sl
VarG

*)

(* changed exprs
Var (Just (7,30)-(7,32)) "sl"
*)

(* typed spans
(7,30)-(7,32)
*)

(* correct types
string list
*)

(* bad types
string
*)
