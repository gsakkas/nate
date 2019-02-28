
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f (f b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(5,29)-(5,38)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Lam (Just (6,10)-(6,66)) (VarPat (Just (6,15)-(6,17)) "f'") (Ite (Just (6,22)-(6,65)) (Bop (Just (6,25)-(6,34)) Eq (App (Just (6,25)-(6,30)) (Var (Just (6,26)-(6,27)) "f") [Var (Just (6,28)-(6,29)) "b"]) (Var (Just (6,33)-(6,34)) "b")) (Tuple (Just (6,40)-(6,49)) [Var (Just (6,41)-(6,42)) "b",Lit (Just (6,44)-(6,48)) (LB True)]) (Tuple (Just (6,55)-(6,65)) [Var (Just (6,56)-(6,57)) "b",Lit (Just (6,59)-(6,64)) (LB False)])) Nothing
*)

(* typed spans
(6,10)-(6,66)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
'a -> ('a * bool)
*)
