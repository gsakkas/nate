
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> (f, (b = (f b)))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (not (b = (f b))))), b);;

*)

(* changed spans
(4,41)-(4,42)
f b
AppG (fromList [VarG])

(4,44)-(4,55)
not (b = f b)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (4,41)-(4,46)) (Var (Just (4,42)-(4,43)) "f") [Var (Just (4,44)-(4,45)) "b"]
App (Just (4,48)-(4,65)) (Var (Just (4,49)-(4,52)) "not") [Bop (Just (4,53)-(4,64)) Eq (Var (Just (4,54)-(4,55)) "b") (App (Just (4,58)-(4,63)) (Var (Just (4,59)-(4,60)) "f") [Var (Just (4,61)-(4,62)) "b"])]
*)

(* typed spans
(4,41)-(4,46)
(4,48)-(4,65)
*)

(* correct types
'a
bool
*)

(* bad types
'a -> 'a
bool
*)
