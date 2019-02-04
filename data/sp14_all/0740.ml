
let g x f = ((f x), ((f x) = x));;

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
(2,8)-(2,32)
EMPTY
EmptyG

(2,13)-(2,18)
EMPTY
EmptyG

(2,14)-(2,15)
x * x
BopG VarG VarG

(2,20)-(2,31)
EMPTY
EmptyG

(2,21)-(2,26)
EMPTY
EmptyG

(2,22)-(2,23)
EMPTY
EmptyG

(2,29)-(2,30)
x < 100
BopG VarG LitG

(4,16)-(5,62)
100
LitG

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
