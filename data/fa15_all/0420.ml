
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then b else b in wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,18)-(7,19)
(b , false)
TupleG (fromList [VarG,LitG])

(7,18)-(7,21)
(b , true)
TupleG (fromList [VarG,LitG])

(7,20)-(7,21)
false
LitG

(7,47)-(7,55)
EMPTY
EmptyG

(7,57)-(7,58)
EMPTY
EmptyG

*)
