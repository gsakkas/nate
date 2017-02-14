
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, (((f b) = (f (b - 1))) && ((f b) = b))), b);;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(3,3)-(3,64)
(5,31)-(5,32)
(5,31)-(5,70)
(5,37)-(5,38)
(5,37)-(5,53)
(5,37)-(5,70)
(5,39)-(5,40)
(5,45)-(5,46)
(5,45)-(5,53)
(5,48)-(5,49)
(5,48)-(5,53)
(5,52)-(5,53)
(5,62)-(5,63)
(5,62)-(5,65)
(5,62)-(5,70)
(5,75)-(5,76)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,55)
(3,50)-(3,51)
(3,50)-(3,55)
(5,22)-(5,28)
(5,22)-(5,76)
(5,31)-(5,70)
(5,31)-(5,76)
*)
