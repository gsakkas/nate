
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,30)-(7,45)
t
VarG

*)

(* changed exprs
Var (Just (7,30)-(7,31)) "t"
*)

(* typed spans
(7,30)-(7,31)
*)

(* correct types
string list
*)

(* bad types
string list
*)
