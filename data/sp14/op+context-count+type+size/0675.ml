
let rec clone x n =
  let acc = [] in if x = 0 then acc else acc :: ((clone x n) - 1);;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;

*)

(* changed spans
(3,2)-(3,65)
(3,21)-(3,22)
(3,21)-(3,26)
(3,25)-(3,26)
(3,32)-(3,35)
(3,41)-(3,44)
(3,41)-(3,65)
(3,48)-(3,65)
(3,49)-(3,60)
(3,63)-(3,64)
*)

(* type error slice
(3,18)-(3,65)
(3,18)-(3,65)
(3,32)-(3,35)
(3,41)-(3,44)
(3,41)-(3,65)
(3,41)-(3,65)
(3,41)-(3,65)
(3,48)-(3,65)
*)
