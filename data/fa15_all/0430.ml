
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile (f, ((f b) = b));;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(6,21)-(6,44)
let funt =
  fun x -> (f b , f b = b) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (6,21)-(6,74)) NonRec [(VarPat (Just (6,25)-(6,29)) "funt",Lam (Just (6,30)-(6,54)) (VarPat (Just (6,30)-(6,31)) "x") (Tuple (Just (6,34)-(6,54)) [App (Just (6,35)-(6,40)) (Var (Just (6,36)-(6,37)) "f") [Var (Just (6,38)-(6,39)) "b"],Bop (Just (6,42)-(6,53)) Eq (App (Just (6,43)-(6,48)) (Var (Just (6,44)-(6,45)) "f") [Var (Just (6,46)-(6,47)) "b"]) (Var (Just (6,51)-(6,52)) "b")]) Nothing)] (App (Just (6,58)-(6,74)) (Var (Just (6,58)-(6,64)) "wwhile") [Tuple (Just (6,65)-(6,74)) [Var (Just (6,66)-(6,70)) "funt",Var (Just (6,72)-(6,73)) "b"]])
*)

(* typed spans
(6,21)-(6,74)
*)

(* correct types
'a
*)

(* bad types
'a
*)
