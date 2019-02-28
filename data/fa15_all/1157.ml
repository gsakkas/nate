
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = sepConcat t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,42)
t
VarG

*)

(* changed exprs
Var (Just (7,31)-(7,32)) "t"
*)

(* typed spans
(7,31)-(7,32)
*)

(* correct types
string list
*)

(* bad types
'a list
*)
