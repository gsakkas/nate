
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if a = "a" then a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,47)
a ^ (x ^ sep)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (6,18)-(6,31)) (Var (Just (6,20)-(6,21)) "^") [Var (Just (6,18)-(6,19)) "a",App (Just (6,22)-(6,31)) (Var (Just (6,25)-(6,26)) "^") [Var (Just (6,23)-(6,24)) "x",Var (Just (6,27)-(6,30)) "sep"]]
*)

(* typed spans
(6,18)-(6,31)
*)

(* correct types
string
*)

(* bad types
unit
*)
