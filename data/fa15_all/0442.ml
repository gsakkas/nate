
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let gs x = (x, (((f x) - x) >= 0)) in wwhile ((f gs), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let gs x = ((f x), (((f x) - x) >= 0)) in wwhile (gs, b);;

*)

(* changed spans
(6,21)-(6,77)
f x
AppG (fromList [VarG])

(6,67)-(6,73)
EMPTY
EmptyG

(6,68)-(6,69)
EMPTY
EmptyG

*)
