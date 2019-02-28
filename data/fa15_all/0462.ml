
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = ((f s) - s) < 0 in
    let iterate (t,y) = t y in
    let rec go r = if isFPoint r then r else go (iterate (x, r)) in go x in
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
(9,4)-(10,72)
s
VarG

(9,4)-(10,72)
f x
AppG (fromList [VarG])

(10,61)-(10,62)
isFPoint
VarG

*)

(* changed exprs
Var (Just (7,34)-(7,35)) "s"
App (Just (7,50)-(7,55)) (Var (Just (7,51)-(7,52)) "f") [Var (Just (7,53)-(7,54)) "x"]
Var (Just (7,58)-(7,66)) "isFPoint"
*)

(* typed spans
(7,34)-(7,35)
(7,50)-(7,55)
(7,58)-(7,66)
*)

(* correct types
int
int
int -> bool
*)

(* bad types
(int -> int * bool)
(int -> int * bool)
int
*)
