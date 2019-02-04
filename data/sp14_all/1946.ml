
let f x = let xx = (x * x) * x in (xx, (xx < 100));;

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let (x,y) = f 8;;

let fixpoint (f,b) = let f x = (f, ((f b) = b)) in wwhile (f, x);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = ((f x), ((f b) = b)) in wwhile (f, b);;

*)

(* changed spans
(2,6)-(2,50)
EMPTY
EmptyG

(2,10)-(2,50)
EMPTY
EmptyG

(2,19)-(2,26)
EMPTY
EmptyG

(2,19)-(2,30)
EMPTY
EmptyG

(2,20)-(2,21)
EMPTY
EmptyG

(2,24)-(2,25)
EMPTY
EmptyG

(2,29)-(2,30)
EMPTY
EmptyG

(2,34)-(2,50)
EMPTY
EmptyG

(2,35)-(2,37)
EMPTY
EmptyG

(2,39)-(2,49)
EMPTY
EmptyG

(2,40)-(2,42)
EMPTY
EmptyG

(2,45)-(2,48)
EMPTY
EmptyG

(9,12)-(9,13)
EMPTY
EmptyG

(9,12)-(9,15)
EMPTY
EmptyG

(9,14)-(9,15)
EMPTY
EmptyG

(11,32)-(11,33)
f x
AppG (fromList [VarG])

(11,35)-(11,46)
x
VarG

(11,62)-(11,63)
b
VarG

*)
