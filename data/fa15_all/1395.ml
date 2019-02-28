
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let fin (f',b') = let nfb = f' b' in (nfb, (nfb = b')) in
     ((fin (f, b)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(6,14)-(6,59)
fun bt -> (bt , f bt = bt)
LamG (TupleG (fromList [EmptyG]))

(7,20)-(7,21)
(fin , b)
TupleG (fromList [VarG])

*)

(* changed exprs
Lam (Just (4,37)-(4,61)) (VarPat (Just (4,37)-(4,39)) "bt") (Tuple (Just (4,42)-(4,61)) [Var (Just (4,43)-(4,45)) "bt",Bop (Just (4,47)-(4,60)) Eq (App (Just (4,48)-(4,54)) (Var (Just (4,49)-(4,50)) "f") [Var (Just (4,51)-(4,53)) "bt"]) (Var (Just (4,57)-(4,59)) "bt")]) Nothing
Tuple (Just (4,65)-(4,73)) [Var (Just (4,66)-(4,69)) "fin",Var (Just (4,71)-(4,72)) "b"]
*)

(* typed spans
(4,37)-(4,61)
(4,65)-(4,73)
*)

(* correct types
'a -> ('a * bool)
('a -> ('a * bool) * 'a)
*)

(* bad types
('a -> 'a * 'a) -> ('a * bool)
'a
*)
