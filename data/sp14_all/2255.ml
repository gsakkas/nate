
let fphelper f b = if (f b) = b then (b, false) else ((f b), true);;

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile (fphelper, b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun z  -> let b = f z in (b, (b != z))), b);;

*)

(* changed spans
(7,29)-(7,37)
fun z ->
  (let b = f z in (b , b <> z))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(7,39)-(7,40)
b
VarG

*)

(* changed exprs
Lam (Just (5,29)-(5,69)) (VarPat (Just (5,34)-(5,35)) "z") (Let (Just (5,40)-(5,68)) NonRec [(VarPat (Just (5,44)-(5,45)) "b",App (Just (5,48)-(5,51)) (Var (Just (5,48)-(5,49)) "f") [Var (Just (5,50)-(5,51)) "z"])] (Tuple (Just (5,55)-(5,68)) [Var (Just (5,56)-(5,57)) "b",Bop (Just (5,59)-(5,67)) Neq (Var (Just (5,60)-(5,61)) "b") (Var (Just (5,65)-(5,66)) "z")])) Nothing
Var (Just (5,71)-(5,72)) "b"
*)

(* typed spans
(5,29)-(5,69)
(5,71)-(5,72)
*)

(* correct types
'a -> ('a * bool)
'a
*)

(* bad types
('a -> 'a) -> 'a -> ('a * bool)
'a
*)
