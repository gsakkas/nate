
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a x in
      let base = "" in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,21)
x
VarG

(7,23)-(7,59)
h
VarG

(7,23)-(7,59)
let l = t in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Var (Just (6,18)-(6,19)) "x"
Var (Just (6,34)-(6,35)) "h"
Let (Just (6,39)-(6,75)) NonRec [(VarPat (Just (6,43)-(6,44)) "l",Var (Just (6,47)-(6,48)) "t")] (App (Just (6,52)-(6,75)) (Var (Just (6,52)-(6,66)) "List.fold_left") [Var (Just (6,67)-(6,68)) "f",Var (Just (6,69)-(6,73)) "base",Var (Just (6,74)-(6,75)) "l"])
*)

(* typed spans
(6,18)-(6,19)
(6,34)-(6,35)
(6,39)-(6,75)
*)

(* correct types
string
string
string
*)

(* bad types
'a
string
string
*)
