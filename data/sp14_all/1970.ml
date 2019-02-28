
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (List.rev x) ^ a in
      let base = sep in let l = sl in List.fold_left f base l;;


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

(7,6)-(7,61)
h ^ sep
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (6,18)-(6,19)) "x"
App (Just (7,17)-(7,24)) (Var (Just (7,19)-(7,20)) "^") [Var (Just (7,17)-(7,18)) "h",Var (Just (7,21)-(7,24)) "sep"]
*)

(* typed spans
(6,18)-(6,19)
(7,17)-(7,24)
*)

(* correct types
string
string
*)

(* bad types
'a list
string
*)
