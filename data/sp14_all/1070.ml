
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> f x not ((f x) = x)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (not ((f x) = x)))), b);;

*)

(* changed spans
(4,40)-(4,59)
(f x , not (f x = x))
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (4,40)-(4,66)) [App (Just (4,41)-(4,46)) (Var (Just (4,42)-(4,43)) "f") [Var (Just (4,44)-(4,45)) "x"],App (Just (4,48)-(4,65)) (Var (Just (4,49)-(4,52)) "not") [Bop (Just (4,53)-(4,64)) Eq (App (Just (4,54)-(4,59)) (Var (Just (4,55)-(4,56)) "f") [Var (Just (4,57)-(4,58)) "x"]) (Var (Just (4,62)-(4,63)) "x")]]
*)

(* typed spans
(4,40)-(4,66)
*)

(* correct types
('a * bool)
*)

(* bad types
'a
*)
