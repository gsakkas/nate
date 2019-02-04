
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let xx = f x in
    match xx with | xx when (xx - x) > 0 -> (x, b) | _ -> ((f x), b) in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let xx = f x in (xx, (xx = x)) in wwhile (gs, b);;

*)

(* changed spans
(9,4)-(9,68)
EMPTY
EmptyG

(9,10)-(9,12)
EMPTY
EmptyG

(9,34)-(9,35)
xx = x
BopG VarG VarG

(9,45)-(9,46)
EMPTY
EmptyG

(9,48)-(9,49)
EMPTY
EmptyG

(9,58)-(9,68)
EMPTY
EmptyG

(9,59)-(9,64)
EMPTY
EmptyG

(9,60)-(9,61)
xx
VarG

(9,66)-(9,67)
EMPTY
EmptyG

*)
