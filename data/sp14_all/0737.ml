
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (b, b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(3,62)
fun x -> (x * x , x < 100)
LamG (TupleG (fromList [EmptyG]))

(5,29)-(5,30)
h
VarG

*)

(* changed exprs
Lam (Just (2,6)-(2,30)) (VarPat (Just (2,6)-(2,7)) "x") (Tuple (Just (2,10)-(2,30)) [Bop (Just (2,11)-(2,18)) Times (Var (Just (2,12)-(2,13)) "x") (Var (Just (2,16)-(2,17)) "x"),Bop (Just (2,20)-(2,29)) Lt (Var (Just (2,21)-(2,22)) "x") (Lit (Just (2,25)-(2,28)) (LI 100))]) Nothing
Var (Just (7,29)-(7,30)) "h"
*)

(* typed spans
(2,6)-(2,30)
(7,29)-(7,30)
*)

(* correct types
int -> (int * bool)
int -> (int * bool)
*)

(* bad types
('a -> ('a * bool) * 'a) -> 'a
'a -> ('a * bool)
*)
