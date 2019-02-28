
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,29)-(5,49)
fun x -> (x , f x = x)
LamG (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (5,29)-(5,57)) (VarPat (Just (5,34)-(5,35)) "x") (Tuple (Just (5,40)-(5,56)) [Var (Just (5,41)-(5,42)) "x",Bop (Just (5,44)-(5,55)) Eq (App (Just (5,45)-(5,50)) (Var (Just (5,46)-(5,47)) "f") [Var (Just (5,48)-(5,49)) "x"]) (Var (Just (5,53)-(5,54)) "x")]) Nothing
*)

(* typed spans
(5,29)-(5,57)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
