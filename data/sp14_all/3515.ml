
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile (let func x y = (x, ((x y) <> y)) in ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(7,21)-(7,42)
fun x -> (0 , true)
LamG (TupleG (fromList [EmptyG]))

(7,47)-(7,57)
func b
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (6,40)-(6,53)) (VarPat (Just (6,40)-(6,41)) "x") (Tuple (Just (6,44)-(6,53)) [Lit (Just (6,45)-(6,46)) (LI 0),Lit (Just (6,48)-(6,52)) (LB True)]) Nothing
App (Just (6,58)-(6,66)) (Var (Just (6,59)-(6,63)) "func") [Var (Just (6,64)-(6,65)) "b"]
*)

(* typed spans
(6,40)-(6,53)
(6,58)-(6,66)
*)

(* correct types
int -> (int * bool)
int -> (int * bool)
*)

(* bad types
'a -> ('a -> 'a * bool)
('a -> 'a * bool)
*)
