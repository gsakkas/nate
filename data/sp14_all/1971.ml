
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (List.rev t) ^ a in
      let base = h ^ sep in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = h ^ sep in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,30)
x
VarG

*)

(* changed exprs
Var (Just (6,18)-(6,19)) "x"
*)

(* typed spans
(6,18)-(6,19)
*)

(* correct types
string
*)

(* bad types
string list
*)
