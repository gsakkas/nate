
let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile (b, b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = f x in (y, (y != x))), b);;

*)

(* changed spans
(5,29)-(5,30)
fun x ->
  (let y = f x in (y , y <> x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (5,29)-(5,69)) (VarPat (Just (5,34)-(5,35)) "x") (Let (Just (5,40)-(5,68)) NonRec [(VarPat (Just (5,44)-(5,45)) "y",App (Just (5,48)-(5,51)) (Var (Just (5,48)-(5,49)) "f") [Var (Just (5,50)-(5,51)) "x"])] (Tuple (Just (5,55)-(5,68)) [Var (Just (5,56)-(5,57)) "y",Bop (Just (5,59)-(5,67)) Neq (Var (Just (5,60)-(5,61)) "y") (Var (Just (5,65)-(5,66)) "x")])) Nothing
*)

(* typed spans
(5,29)-(5,69)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
'a -> ('a * bool)
*)
