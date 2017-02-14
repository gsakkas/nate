
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not f), ((f b) = b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(3,30)-(3,63)
(5,28)-(5,53)
(5,29)-(5,36)
(5,30)-(5,33)
(5,34)-(5,35)
(5,38)-(5,49)
(5,39)-(5,44)
(5,40)-(5,41)
(5,42)-(5,43)
*)

(* type error slice
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(5,21)-(5,27)
(5,21)-(5,53)
(5,28)-(5,53)
(5,29)-(5,36)
(5,30)-(5,33)
(5,34)-(5,35)
(5,39)-(5,44)
(5,40)-(5,41)
*)
