
let f' (f,b) = (f b) = b;;

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' x = if (f x) = b then (b, true) else ((f' x), false) in f' 1),
      b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' x = if (f x) = b then (b, true) else ((f x), false) in f'), b);;

*)

(* changed spans
(2,15)-(2,20)
EMPTY
EmptyG

(2,15)-(2,24)
EMPTY
EmptyG

(2,16)-(2,17)
EMPTY
EmptyG

(2,18)-(2,19)
EMPTY
EmptyG

(2,23)-(2,24)
EMPTY
EmptyG

(4,16)-(5,63)
EMPTY
EmptyG

(9,52)-(9,54)
f
VarG

(9,69)-(9,73)
EMPTY
EmptyG

(9,72)-(9,73)
EMPTY
EmptyG

*)
