
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let b = f b in (b, (b != b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((fun fixb  -> let b = f b in (b, (fixb != b))), b);;

*)

(* changed spans
(5,29)-(5,59)
fun fixb ->
  (let b = f b in
   (b , fixb <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (6,10)-(6,56)) (VarPat (Just (6,15)-(6,19)) "fixb") (Let (Just (6,24)-(6,55)) NonRec [(VarPat (Just (6,28)-(6,29)) "b",App (Just (6,32)-(6,35)) (Var (Just (6,32)-(6,33)) "f") [Var (Just (6,34)-(6,35)) "b"])] (Tuple (Just (6,39)-(6,55)) [Var (Just (6,40)-(6,41)) "b",Bop (Just (6,43)-(6,54)) Neq (Var (Just (6,44)-(6,48)) "fixb") (Var (Just (6,52)-(6,53)) "b")])) Nothing
*)

(* typed spans
(6,10)-(6,56)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
