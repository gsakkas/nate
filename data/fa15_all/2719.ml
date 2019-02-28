
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> fun x  -> ((f x), (x = (f x)))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g x = let calcx = f x in (calcx, (calcx = x)) in (g, b));;

*)

(* changed spans
(4,28)-(4,75)
let g =
  fun x ->
    (let calcx = f x in
     (calcx , calcx = x)) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (5,9)-(5,70)) NonRec [(VarPat (Just (5,14)-(5,15)) "g",Lam (Just (5,16)-(5,59)) (VarPat (Just (5,16)-(5,17)) "x") (Let (Just (5,20)-(5,59)) NonRec [(VarPat (Just (5,24)-(5,29)) "calcx",App (Just (5,32)-(5,35)) (Var (Just (5,32)-(5,33)) "f") [Var (Just (5,34)-(5,35)) "x"])] (Tuple (Just (5,39)-(5,59)) [Var (Just (5,40)-(5,45)) "calcx",Bop (Just (5,47)-(5,58)) Eq (Var (Just (5,48)-(5,53)) "calcx") (Var (Just (5,56)-(5,57)) "x")])) Nothing)] (Tuple (Just (5,63)-(5,69)) [Var (Just (5,64)-(5,65)) "g",Var (Just (5,67)-(5,68)) "b"])
*)

(* typed spans
(5,9)-(5,70)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
('a -> 'b -> ('b * bool) * 'c)
*)
