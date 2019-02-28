
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> a | hd::tl -> a ^ (sep ^ hd) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,67)
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
string
*)
