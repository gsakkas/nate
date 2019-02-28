
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile ((fun x  -> ((wwhile (f, b)), (not (b = (f b))))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(5,30)-(5,36)
f
VarG

(5,30)-(5,36)
b
VarG

(5,39)-(5,56)
b = f b
BopG VarG (AppG (fromList [EmptyG]))

(5,39)-(5,56)
b
VarG

(5,39)-(5,56)
f b
AppG (fromList [VarG])

(5,39)-(5,56)
f
VarG

(5,39)-(5,56)
b
VarG

*)

(* changed exprs
Var (Just (4,42)-(4,43)) "f"
Var (Just (4,44)-(4,45)) "b"
Bop (Just (4,48)-(4,59)) Eq (Var (Just (4,49)-(4,50)) "b") (App (Just (4,53)-(4,58)) (Var (Just (4,54)-(4,55)) "f") [Var (Just (4,56)-(4,57)) "b"])
Var (Just (4,49)-(4,50)) "b"
App (Just (4,53)-(4,58)) (Var (Just (4,54)-(4,55)) "f") [Var (Just (4,56)-(4,57)) "b"]
Var (Just (4,54)-(4,55)) "f"
Var (Just (4,56)-(4,57)) "b"
*)

(* typed spans
(4,42)-(4,43)
(4,44)-(4,45)
(4,48)-(4,59)
(4,49)-(4,50)
(4,53)-(4,58)
(4,54)-(4,55)
(4,56)-(4,57)
*)

(* correct types
'a -> 'a
'a
bool
'a
'a
'a -> 'a
'a
*)

(* bad types
('a -> ('a * bool) * 'a)
('a -> ('a * bool) * 'a)
bool
bool
bool
bool
bool
*)
