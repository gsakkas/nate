
let rec wwhile (f,b) = let (b',c') = f b in if c' then f b' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,55)-(2,56)
*)

(* type error slice
(2,23)-(2,67)
(2,37)-(2,38)
(2,37)-(2,40)
(2,44)-(2,67)
(2,44)-(2,67)
(2,55)-(2,56)
(2,55)-(2,59)
(2,65)-(2,67)
*)
