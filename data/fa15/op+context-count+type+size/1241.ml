
let fixpointHelper f b =
  let c = f b in if c = b then (c, true) else (c, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(3,2)-(3,56)
(3,10)-(3,13)
(3,20)-(3,21)
(3,24)-(3,25)
(3,31)-(3,40)
(3,32)-(3,33)
(3,46)-(3,56)
(3,47)-(3,48)
*)

(* type error slice
(2,3)-(3,58)
(2,19)-(3,56)
(2,21)-(3,56)
(3,2)-(3,56)
(3,17)-(3,56)
(3,31)-(3,40)
(6,8)-(6,9)
(6,8)-(6,11)
(6,46)-(6,52)
(6,46)-(6,61)
(6,53)-(6,61)
(6,54)-(6,55)
(8,21)-(8,27)
(8,21)-(8,53)
(8,28)-(8,53)
(8,29)-(8,49)
(8,30)-(8,44)
*)
