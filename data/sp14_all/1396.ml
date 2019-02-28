
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h ^ sep in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,6)-(7,64)
sep ^ x
AppG (fromList [VarG])

(7,36)-(7,37)
let base = h in
let l = sl in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(7,41)-(7,64)
let l = sl in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
App (Just (6,22)-(6,31)) (Var (Just (6,27)-(6,28)) "^") [Var (Just (6,23)-(6,26)) "sep",Var (Just (6,29)-(6,30)) "x"]
Let (Just (7,6)-(7,59)) NonRec [(VarPat (Just (7,10)-(7,14)) "base",Var (Just (7,17)-(7,18)) "h")] (Let (Just (7,22)-(7,59)) NonRec [(VarPat (Just (7,26)-(7,27)) "l",Var (Just (7,30)-(7,32)) "sl")] (App (Just (7,36)-(7,59)) (Var (Just (7,36)-(7,50)) "List.fold_left") [Var (Just (7,51)-(7,52)) "f",Var (Just (7,53)-(7,57)) "base",Var (Just (7,58)-(7,59)) "l"]))
Let (Just (7,22)-(7,59)) NonRec [(VarPat (Just (7,26)-(7,27)) "l",Var (Just (7,30)-(7,32)) "sl")] (App (Just (7,36)-(7,59)) (Var (Just (7,36)-(7,50)) "List.fold_left") [Var (Just (7,51)-(7,52)) "f",Var (Just (7,53)-(7,57)) "base",Var (Just (7,58)-(7,59)) "l"])
*)

(* typed spans
(6,22)-(6,31)
(7,6)-(7,59)
(7,22)-(7,59)
*)

(* correct types
string
string
string
*)

(* bad types
string
string
string
*)
