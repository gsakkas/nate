
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = (f, ((f b) = b)) in wwhile (f, (f b));;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = ((f x), ((f b) = b)) in wwhile (f, b);;

*)

(* changed spans
(7,32)-(7,33)
f x
AppG (fromList [VarG])

(7,35)-(7,46)
x
VarG

(7,62)-(7,67)
EMPTY
EmptyG

(7,63)-(7,64)
EMPTY
EmptyG

*)
