
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (a t)) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,29)-(6,34)
a
VarG

*)

(* changed exprs
Var (Just (6,29)-(6,30)) "a"
*)

(* typed spans
(6,29)-(6,30)
*)

(* correct types
string
*)

(* bad types
string
*)
