
let g x f = ((f x), ((f x) = x));;

let h q x y = q x y;;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((h g f b), b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,8)-(2,32)
(x * x , x < 100)
TupleG (fromList [BopG EmptyG EmptyG])

(9,29)-(9,38)
h
VarG

(9,29)-(9,38)
b
VarG

*)

(* changed exprs
Tuple (Just (2,10)-(2,30)) [Bop (Just (2,11)-(2,18)) Times (Var (Just (2,12)-(2,13)) "x") (Var (Just (2,16)-(2,17)) "x"),Bop (Just (2,20)-(2,29)) Lt (Var (Just (2,21)-(2,22)) "x") (Lit (Just (2,25)-(2,28)) (LI 100))]
Var (Just (7,29)-(7,30)) "h"
Var (Just (7,32)-(7,33)) "b"
*)

(* typed spans
(2,10)-(2,30)
(7,29)-(7,30)
(7,32)-(7,33)
*)

(* correct types
(int * bool)
int -> (int * bool)
int
*)

(* bad types
('a -> 'a) -> ('a * bool)
('a * bool)
('a * bool)
*)
