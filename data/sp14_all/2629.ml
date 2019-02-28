
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x ^ sep) ^ a in
      let base = "" in let l = h ^ t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x ^ sep) ^ a in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,36)
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
string list
*)
