
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = ((f s) - s) < 0 in
    let iterate (t,y) = t y in
    let rec go r =
      if isFPoint r then (r, true) else go ((iterate (x, r)), false) in
    go x in
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
(9,4)-(12,8)
s
VarG

(9,4)-(12,8)
s
VarG

(9,4)-(12,8)
f
VarG

(11,62)-(11,67)
isFPoint
VarG

*)

(* changed exprs
Var (Just (7,34)-(7,35)) "s"
Var (Just (7,39)-(7,40)) "s"
Var (Just (7,51)-(7,52)) "f"
Var (Just (7,58)-(7,66)) "isFPoint"
*)

(* typed spans
(7,34)-(7,35)
(7,39)-(7,40)
(7,51)-(7,52)
(7,58)-(7,66)
*)

(* correct types
int
int
int -> int
int -> bool
*)

(* bad types
(int -> 'a * bool)
(int -> 'a * bool)
(int -> 'a * bool)
bool
*)
