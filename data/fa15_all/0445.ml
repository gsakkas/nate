
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let xx = f x in match xx with | xx when (xx - x) > 0 -> (x, b) | _ -> f x in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let xx = f x in (xx, (xx = x)) in wwhile (gs, b);;

*)

(* changed spans
(8,20)-(8,77)
EMPTY
EmptyG

(8,26)-(8,28)
EMPTY
EmptyG

(8,45)-(8,47)
xx = x
BopG VarG VarG

(8,61)-(8,62)
EMPTY
EmptyG

(8,64)-(8,65)
EMPTY
EmptyG

(8,74)-(8,75)
xx
VarG

(8,74)-(8,77)
EMPTY
EmptyG

*)
