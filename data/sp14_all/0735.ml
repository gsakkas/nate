
let g x y = ((y x), false);;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((g b f), b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,8)-(2,26)
EMPTY
EmptyG

(2,13)-(2,18)
EMPTY
EmptyG

(2,14)-(2,15)
x * x
BopG VarG VarG

(2,20)-(2,25)
x
VarG

(4,16)-(5,62)
x < 100
BopG VarG LitG

(7,29)-(7,36)
EMPTY
EmptyG

(7,30)-(7,31)
EMPTY
EmptyG

(7,32)-(7,33)
EMPTY
EmptyG

(7,34)-(7,35)
h
VarG

*)
