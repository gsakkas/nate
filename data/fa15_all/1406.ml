
let rec additivePersistence n n = additivePersistence (n mod 10);;


(* fix

let rec additivePersistence n = (additivePersistence (n mod 10)) + n;;

*)

(* changed spans
(2,30)-(2,64)
additivePersistence (n mod 10) + n
BopG (AppG (fromList [EmptyG])) VarG

*)

(* changed exprs
Bop (Just (2,32)-(2,68)) Plus (App (Just (2,32)-(2,64)) (Var (Just (2,33)-(2,52)) "additivePersistence") [Bop (Just (2,53)-(2,63)) Mod (Var (Just (2,54)-(2,55)) "n") (Lit (Just (2,60)-(2,62)) (LI 10))]) (Var (Just (2,67)-(2,68)) "n")
*)

(* typed spans
(2,32)-(2,68)
*)

(* correct types
int
*)

(* bad types
int -> 'a
*)
