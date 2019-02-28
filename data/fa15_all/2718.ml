
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> b = (f b)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,40)-(4,49)
(f b , b = f b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
Tuple (Just (4,40)-(4,60)) [App (Just (4,41)-(4,46)) (Var (Just (4,42)-(4,43)) "f") [Var (Just (4,44)-(4,45)) "b"],Bop (Just (4,48)-(4,59)) Eq (Var (Just (4,49)-(4,50)) "b") (App (Just (4,53)-(4,58)) (Var (Just (4,54)-(4,55)) "f") [Var (Just (4,56)-(4,57)) "b"])]
*)

(* typed spans
(4,40)-(4,60)
*)

(* correct types
('a * bool)
*)

(* bad types
bool
*)
