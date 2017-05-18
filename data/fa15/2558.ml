
let rec wwhile (f,b) = let (x,y) = f b in if y then (wwhile f) * x else x;;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, y) else x;;

*)

(* changed spans
(2,52)-(2,66)
(2,60)-(2,61)
(2,65)-(2,66)
*)

(* type error slice
(2,3)-(2,75)
(2,16)-(2,73)
(2,52)-(2,62)
(2,53)-(2,59)
(2,60)-(2,61)
*)

(* all spans
(2,16)-(2,73)
(2,23)-(2,73)
(2,35)-(2,38)
(2,35)-(2,36)
(2,37)-(2,38)
(2,42)-(2,73)
(2,45)-(2,46)
(2,52)-(2,66)
(2,52)-(2,62)
(2,53)-(2,59)
(2,60)-(2,61)
(2,65)-(2,66)
(2,72)-(2,73)
*)