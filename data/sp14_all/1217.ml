
let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f x = wwhile (f, x) in f b), b);;


(* fix

let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> (x, (x = b))), b);;

*)

(* changed spans
(5,29)-(5,61)
fun x -> (x , x = b)
LamG (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (5,29)-(5,53)) (VarPat (Just (5,34)-(5,35)) "x") (Tuple (Just (5,40)-(5,52)) [Var (Just (5,41)-(5,42)) "x",Bop (Just (5,44)-(5,51)) Eq (Var (Just (5,45)-(5,46)) "x") (Var (Just (5,49)-(5,50)) "b")]) Nothing
*)

(* typed spans
(5,29)-(5,53)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
'a
*)
