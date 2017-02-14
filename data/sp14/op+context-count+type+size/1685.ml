
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = if (wwhile (f, b)) = b then b else wwhile (f, (f b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,21)-(5,73)
(5,24)-(5,43)
(5,33)-(5,34)
(5,36)-(5,37)
(5,42)-(5,43)
(5,49)-(5,50)
(5,56)-(5,62)
(5,56)-(5,73)
(5,63)-(5,73)
(5,64)-(5,65)
(5,67)-(5,72)
(5,68)-(5,69)
*)

(* type error slice
(3,2)-(3,62)
(3,8)-(3,9)
(3,8)-(3,11)
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(3,57)-(3,58)
(3,60)-(3,61)
(5,56)-(5,62)
(5,56)-(5,73)
(5,63)-(5,73)
(5,64)-(5,65)
(5,67)-(5,72)
(5,68)-(5,69)
*)
