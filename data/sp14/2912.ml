
let rec wwhile (f,b) =
  match f b with | (k,tf) -> if tf = false then k else wwhile (f, k);;

let fixpoint (f,b) = wwhile (fun a  -> ((f a), ((f a) != a), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (k,tf) -> if tf = false then k else wwhile (f, k);;

let fixpoint (f,b) = wwhile ((fun a  -> ((f a), ((f a) != a))), b);;

*)

(* changed spans
(5,28)-(5,64)
(5,39)-(5,63)
*)

(* type error slice
(3,55)-(3,61)
(3,55)-(3,68)
(3,62)-(3,68)
(5,21)-(5,27)
(5,21)-(5,64)
(5,28)-(5,64)
*)

(* all spans
(2,16)-(3,68)
(3,2)-(3,68)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,29)-(3,68)
(3,32)-(3,42)
(3,32)-(3,34)
(3,37)-(3,42)
(3,48)-(3,49)
(3,55)-(3,68)
(3,55)-(3,61)
(3,62)-(3,68)
(3,63)-(3,64)
(3,66)-(3,67)
(5,14)-(5,64)
(5,21)-(5,64)
(5,21)-(5,27)
(5,28)-(5,64)
(5,39)-(5,63)
(5,40)-(5,45)
(5,41)-(5,42)
(5,43)-(5,44)
(5,47)-(5,59)
(5,48)-(5,53)
(5,49)-(5,50)
(5,51)-(5,52)
(5,57)-(5,58)
(5,61)-(5,62)
*)