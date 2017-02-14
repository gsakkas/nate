
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((if (f b) = b then b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,29)-(5,50)
(5,30)-(5,49)
(5,33)-(5,38)
(5,33)-(5,42)
(5,34)-(5,35)
(5,41)-(5,42)
(5,48)-(5,49)
(5,52)-(5,53)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(3,57)-(3,58)
(5,21)-(5,27)
(5,21)-(5,54)
(5,28)-(5,54)
(5,29)-(5,50)
(5,30)-(5,49)
*)
