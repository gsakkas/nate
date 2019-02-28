
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun (f,b)  -> if (f b) = b then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, false) else ((f b), true)), b);;

*)

(* changed spans
(6,10)-(6,73)
fun f' ->
  if f b = b
  then (b , false)
  else (f b , true)
LamG (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Lam (Just (6,10)-(6,70)) (VarPat (Just (6,15)-(6,17)) "f'") (Ite (Just (6,22)-(6,69)) (Bop (Just (6,25)-(6,34)) Eq (App (Just (6,25)-(6,30)) (Var (Just (6,26)-(6,27)) "f") [Var (Just (6,28)-(6,29)) "b"]) (Var (Just (6,33)-(6,34)) "b")) (Tuple (Just (6,40)-(6,50)) [Var (Just (6,41)-(6,42)) "b",Lit (Just (6,44)-(6,49)) (LB False)]) (Tuple (Just (6,56)-(6,69)) [App (Just (6,57)-(6,62)) (Var (Just (6,58)-(6,59)) "f") [Var (Just (6,60)-(6,61)) "b"],Lit (Just (6,64)-(6,68)) (LB True)])) Nothing
*)

(* typed spans
(6,10)-(6,70)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a -> 'a * 'a) -> ('a * bool)
*)
