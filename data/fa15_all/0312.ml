
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (x ^ sl) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,30)
x
VarG

*)

(* changed exprs
Var (Just (6,22)-(6,23)) "x"
*)

(* typed spans
(6,22)-(6,23)
*)

(* correct types
string
*)

(* bad types
string
*)
