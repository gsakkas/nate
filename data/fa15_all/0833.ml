
let count = 0;;

let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then count;;


(* fix

let count = 0;;

let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then count else 8;;

*)

(* changed spans
(6,32)-(6,52)
8
LitG

*)

(* changed exprs
Lit (Just (6,58)-(6,59)) (LI 8)
*)

(* typed spans
(6,58)-(6,59)
*)

(* correct types
int
*)

(* bad types
unit
*)
