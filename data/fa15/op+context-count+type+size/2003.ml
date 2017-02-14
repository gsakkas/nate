
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

*)

(* changed spans
(3,48)-(3,49)
(3,48)-(3,70)
(3,53)-(3,70)
(3,63)-(3,64)
*)

(* type error slice
(2,3)-(3,72)
(2,14)-(3,70)
(2,16)-(3,70)
(3,2)-(3,70)
(3,25)-(3,70)
(3,39)-(3,42)
(3,48)-(3,70)
(3,53)-(3,70)
(3,53)-(3,70)
(3,54)-(3,65)
(3,55)-(3,60)
*)
