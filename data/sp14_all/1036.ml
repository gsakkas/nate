
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a @ sep in
      let base = t in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,20)-(6,21)
(^)
VarG

(7,22)-(7,58)
h
VarG

(7,22)-(7,58)
let l = t in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Var (Just (6,20)-(6,21)) "^"
Var (Just (7,17)-(7,18)) "h"
Let (Just (7,22)-(7,58)) NonRec [(VarPat (Just (7,26)-(7,27)) "l",Var (Just (7,30)-(7,31)) "t")] (App (Just (7,35)-(7,58)) (Var (Just (7,35)-(7,49)) "List.fold_left") [Var (Just (7,50)-(7,51)) "f",Var (Just (7,52)-(7,56)) "base",Var (Just (7,57)-(7,58)) "l"])
*)

(* typed spans
(6,20)-(6,21)
(7,17)-(7,18)
(7,22)-(7,58)
*)

(* correct types
string -> string -> string
string
string
*)

(* bad types
'a list list -> 'a list list -> 'a list list
'a list list
'a list list
*)
