
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = [t] in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,47)-(6,50)
t
VarG

*)

(* changed exprs
Var (Just (6,47)-(6,48)) "t"
*)

(* typed spans
(6,47)-(6,48)
*)

(* correct types
string list
*)

(* bad types
'a list list
*)
