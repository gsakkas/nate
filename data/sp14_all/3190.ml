
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in
      let base = "" in let l = h ^ t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,36)
t
VarG

*)

(* changed exprs
Var (Just (6,48)-(6,49)) "t"
*)

(* typed spans
(6,48)-(6,49)
*)

(* correct types
string list
*)

(* bad types
'a list
*)
