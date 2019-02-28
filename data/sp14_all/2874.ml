
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = h in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sepConcat sep t) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,25)
sepConcat sep t
AppG (fromList [VarG])

(7,30)-(7,45)
t
VarG

*)

(* changed exprs
App (Just (6,22)-(6,39)) (Var (Just (6,23)-(6,32)) "sepConcat") [Var (Just (6,33)-(6,36)) "sep",Var (Just (6,37)-(6,38)) "t"]
Var (Just (7,30)-(7,31)) "t"
*)

(* typed spans
(6,22)-(6,39)
(7,30)-(7,31)
*)

(* correct types
string
string list
*)

(* bad types
string
'a list
*)
