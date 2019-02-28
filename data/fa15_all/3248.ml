
let pipe fs = let f a x x = x a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = let c y = x (a y) in c in
  let base = let g y = y in g in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
let c = fun y -> x (a y) in c
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,44)-(2,49)
let g = fun y -> y in g
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,53)-(2,77)
g
VarG

*)

(* changed exprs
Let (Just (3,14)-(3,36)) NonRec [(VarPat (Just (3,18)-(3,19)) "c",Lam (Just (3,20)-(3,31)) (VarPat (Just (3,20)-(3,21)) "y") (App (Just (3,24)-(3,31)) (Var (Just (3,24)-(3,25)) "x") [App (Just (3,26)-(3,31)) (Var (Just (3,27)-(3,28)) "a") [Var (Just (3,29)-(3,30)) "y"]]) Nothing)] (Var (Just (3,35)-(3,36)) "c")
Let (Just (4,13)-(4,29)) NonRec [(VarPat (Just (4,17)-(4,18)) "g",Lam (Just (4,19)-(4,24)) (VarPat (Just (4,19)-(4,20)) "y") (Var (Just (4,23)-(4,24)) "y") Nothing)] (Var (Just (4,28)-(4,29)) "g")
Var (Just (4,28)-(4,29)) "g"
*)

(* typed spans
(3,14)-(3,36)
(4,13)-(4,29)
(4,28)-(4,29)
*)

(* correct types
'a -> 'a
'a -> 'a
'a -> 'a
*)

(* bad types
('a -> 'b) -> 'b
'a -> 'a
'a
*)
