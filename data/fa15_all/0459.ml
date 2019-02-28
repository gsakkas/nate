
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint x = ((f x) - x) < 0 in
    let iterate (t,y) = t y in
    let rec go r = if isFPoint r then r else go (iterate (x, r)) in x in
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

(9,4)-(10,69)
(f x , isFPoint x)
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (7,26)-(7,45)) (VarPat (Just (7,26)-(7,27)) "s") (Bop (Just (7,30)-(7,45)) Lt (Bop (Just (7,30)-(7,41)) Minus (App (Just (7,31)-(7,36)) (Var (Just (7,32)-(7,33)) "f") [Var (Just (7,34)-(7,35)) "s"]) (Var (Just (7,39)-(7,40)) "s")) (Lit (Just (7,44)-(7,45)) (LI 0))) Nothing
Tuple (Just (7,49)-(7,70)) [App (Just (7,50)-(7,55)) (Var (Just (7,51)-(7,52)) "f") [Var (Just (7,53)-(7,54)) "x"],App (Just (7,57)-(7,69)) (Var (Just (7,58)-(7,66)) "isFPoint") [Var (Just (7,67)-(7,68)) "x"]]
*)

(* typed spans
(7,26)-(7,45)
(7,49)-(7,70)
*)

(* correct types
int -> bool
(int * bool)
*)

(* bad types
int -> bool
int -> int
*)
