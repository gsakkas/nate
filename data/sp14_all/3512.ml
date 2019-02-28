
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile ((f, ((f b) <> b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,50)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (6,28)-(6,71)) NonRec [(VarPat (Just (6,33)-(6,37)) "func",Lam (Just (6,38)-(6,53)) (VarPat (Just (6,38)-(6,39)) "x") (Lam (Just (6,40)-(6,53)) (VarPat (Just (6,40)-(6,41)) "x") (Tuple (Just (6,44)-(6,53)) [Lit (Just (6,45)-(6,46)) (LI 0),Lit (Just (6,48)-(6,52)) (LB True)]) Nothing) Nothing)] (Tuple (Just (6,57)-(6,70)) [App (Just (6,58)-(6,66)) (Var (Just (6,59)-(6,63)) "func") [Var (Just (6,64)-(6,65)) "b"],Var (Just (6,68)-(6,69)) "b"])
*)

(* typed spans
(6,28)-(6,71)
*)

(* correct types
(int -> (int * bool) * int)
*)

(* bad types
(('a -> 'a * bool) * 'a)
*)
