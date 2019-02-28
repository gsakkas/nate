
let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile
    ((fun x  -> let xi = f x in (xi, (((f xi) != xi) || (f (f xi))))), b);;

*)

(* changed spans
(6,29)-(6,31)
fun x ->
  (let xi = f x in
   (xi , (f xi <> xi) || f (f xi)))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (8,5)-(8,69)) (VarPat (Just (8,10)-(8,11)) "x") (Let (Just (8,16)-(8,68)) NonRec [(VarPat (Just (8,20)-(8,22)) "xi",App (Just (8,25)-(8,28)) (Var (Just (8,25)-(8,26)) "f") [Var (Just (8,27)-(8,28)) "x"])] (Tuple (Just (8,32)-(8,68)) [Var (Just (8,33)-(8,35)) "xi",Bop (Just (8,37)-(8,67)) Or (Bop (Just (8,38)-(8,52)) Neq (App (Just (8,39)-(8,45)) (Var (Just (8,40)-(8,41)) "f") [Var (Just (8,42)-(8,44)) "xi"]) (Var (Just (8,49)-(8,51)) "xi")) (App (Just (8,56)-(8,66)) (Var (Just (8,57)-(8,58)) "f") [App (Just (8,59)-(8,65)) (Var (Just (8,60)-(8,61)) "f") [Var (Just (8,62)-(8,64)) "xi"]])])) Nothing
*)

(* typed spans
(8,5)-(8,69)
*)

(* correct types
bool -> (bool * bool)
*)

(* bad types
unit
*)
