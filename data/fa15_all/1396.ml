
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let fin b' = (b', ((f b') = b')) in ((fin b), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(5,18)-(5,42)
fun bt -> (bt , f bt = bt)
LamG (TupleG (fromList [EmptyG]))

(5,47)-(5,54)
fin
VarG

(5,47)-(5,54)
b
VarG

*)

(* changed exprs
Lam (Just (4,37)-(4,61)) (VarPat (Just (4,37)-(4,39)) "bt") (Tuple (Just (4,42)-(4,61)) [Var (Just (4,43)-(4,45)) "bt",Bop (Just (4,47)-(4,60)) Eq (App (Just (4,48)-(4,54)) (Var (Just (4,49)-(4,50)) "f") [Var (Just (4,51)-(4,53)) "bt"]) (Var (Just (4,57)-(4,59)) "bt")]) Nothing
Var (Just (4,66)-(4,69)) "fin"
Var (Just (4,71)-(4,72)) "b"
*)

(* typed spans
(4,37)-(4,61)
(4,66)-(4,69)
(4,71)-(4,72)
*)

(* correct types
'a -> ('a * bool)
'a -> ('a * bool)
'a
*)

(* bad types
'a -> ('a * bool)
('a * bool)
('a * bool)
*)
