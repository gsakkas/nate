
let g x y = ((y (y x)), false);;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((g b f), b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,8)-(2,30)
(x * x , x < 100)
TupleG (fromList [BopG EmptyG EmptyG])

(7,29)-(7,36)
h
VarG

*)

(* changed exprs
Tuple (Just (2,10)-(2,30)) [Bop (Just (2,11)-(2,18)) Times (Var (Just (2,12)-(2,13)) "x") (Var (Just (2,16)-(2,17)) "x"),Bop (Just (2,20)-(2,29)) Lt (Var (Just (2,21)-(2,22)) "x") (Lit (Just (2,25)-(2,28)) (LI 100))]
Var (Just (7,29)-(7,30)) "h"
*)

(* typed spans
(2,10)-(2,30)
(7,29)-(7,30)
*)

(* correct types
(int * bool)
int -> (int * bool)
*)

(* bad types
('a -> 'a) -> ('a * bool)
('a * bool)
*)
