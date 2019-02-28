
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint x = ((f x) - x) < 0 in
    let iterate (t,y) = t y in
    let rec go r = if isFPoint r then r else go (iterate (x, r)) in go 1 in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(8,17)-(8,36)
fun s -> (f s - s) < 0
LamG (BopG EmptyG EmptyG)

(9,4)-(10,72)
(f x , isFPoint x)
TupleG (fromList [AppG (fromList [EmptyG])])

(11,2)-(11,16)
isFPoint
VarG

(11,2)-(11,16)
x
VarG

(11,2)-(11,16)
wwhile (gs , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(11,2)-(11,16)
wwhile
VarG

(11,2)-(11,16)
EMPTY
EmptyG

*)

(* changed exprs
Lam (Just (7,26)-(7,45)) (VarPat (Just (7,26)-(7,27)) "s") (Bop (Just (7,30)-(7,45)) Lt (Bop (Just (7,30)-(7,41)) Minus (App (Just (7,31)-(7,36)) (Var (Just (7,32)-(7,33)) "f") [Var (Just (7,34)-(7,35)) "s"]) (Var (Just (7,39)-(7,40)) "s")) (Lit (Just (7,44)-(7,45)) (LI 0))) Nothing
Tuple (Just (7,49)-(7,70)) [App (Just (7,50)-(7,55)) (Var (Just (7,51)-(7,52)) "f") [Var (Just (7,53)-(7,54)) "x"],App (Just (7,57)-(7,69)) (Var (Just (7,58)-(7,66)) "isFPoint") [Var (Just (7,67)-(7,68)) "x"]]
Var (Just (7,58)-(7,66)) "isFPoint"
Var (Just (7,67)-(7,68)) "x"
App (Just (8,2)-(8,16)) (Var (Just (8,2)-(8,8)) "wwhile") [Tuple (Just (8,9)-(8,16)) [Var (Just (8,10)-(8,12)) "gs",Var (Just (8,14)-(8,15)) "b"]]
Var (Just (8,2)-(8,8)) "wwhile"
Var (Just (11,2)-(11,16)) "EMPTY"
*)

(* typed spans
(7,26)-(7,45)
(7,49)-(7,70)
(7,58)-(7,66)
(7,67)-(7,68)
(8,2)-(8,16)
(8,2)-(8,8)
*)

(* correct types
int -> bool
(int * bool)
int -> bool
int
int
(int -> (int * bool) * int) -> int
*)

(* bad types
int -> bool
int
'a
'a
'a
'a
*)
