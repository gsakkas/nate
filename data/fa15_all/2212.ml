
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let func x = f in (f, (not ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,28)-(5,73)
(fun x -> (f b , 3 < 4) , b)
TupleG (fromList [VarG,LamG EmptyG])

*)

(* changed exprs
Tuple (Just (5,28)-(5,61)) [Lam (Just (5,29)-(5,57)) (VarPat (Just (5,34)-(5,35)) "x") (Tuple (Just (5,40)-(5,56)) [App (Just (5,41)-(5,46)) (Var (Just (5,42)-(5,43)) "f") [Var (Just (5,44)-(5,45)) "b"],Bop (Just (5,48)-(5,55)) Lt (Lit (Just (5,49)-(5,50)) (LI 3)) (Lit (Just (5,53)-(5,54)) (LI 4))]) Nothing,Var (Just (5,59)-(5,60)) "b"]
*)

(* typed spans
(5,28)-(5,61)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
('a -> 'a * bool * 'a)
*)
