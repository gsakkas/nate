
let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,2)-(3,72)
(3,14)-(3,17)
(3,21)-(3,72)
(3,27)-(3,28)
(3,46)-(3,47)
(3,59)-(3,65)
(3,59)-(3,72)
(3,67)-(3,68)
(5,14)-(5,35)
(5,21)-(5,27)
(5,21)-(5,35)
(5,28)-(5,35)
(5,29)-(5,31)
*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(3,59)-(3,65)
(3,59)-(3,72)
(3,66)-(3,72)
(3,67)-(3,68)
(5,21)-(5,27)
(5,21)-(5,35)
(5,28)-(5,35)
(5,29)-(5,31)
*)
