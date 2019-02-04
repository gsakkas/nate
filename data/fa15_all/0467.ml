
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
EMPTY
EmptyG

(9,17)-(9,27)
EMPTY
EmptyG

(9,24)-(9,25)
EMPTY
EmptyG

(9,24)-(9,27)
EMPTY
EmptyG

(9,26)-(9,27)
EMPTY
EmptyG

(10,4)-(12,8)
EMPTY
EmptyG

(10,15)-(11,68)
EMPTY
EmptyG

(11,6)-(11,68)
EMPTY
EmptyG

(11,9)-(11,17)
EMPTY
EmptyG

(11,9)-(11,19)
EMPTY
EmptyG

(11,18)-(11,19)
EMPTY
EmptyG

(11,26)-(11,27)
EMPTY
EmptyG

(11,29)-(11,33)
EMPTY
EmptyG

(11,40)-(11,42)
EMPTY
EmptyG

(11,43)-(11,68)
EMPTY
EmptyG

(11,44)-(11,60)
EMPTY
EmptyG

(11,45)-(11,52)
EMPTY
EmptyG

(11,53)-(11,59)
f
VarG

(11,57)-(11,58)
EMPTY
EmptyG

(11,62)-(11,67)
EMPTY
EmptyG

(12,4)-(12,6)
isFPoint
VarG

*)
