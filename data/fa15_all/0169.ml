
let rec digitsOfInt n = [digitsOfInt n; n mod 10];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 10] else [];;

*)

(* changed spans
(2,24)-(2,49)
if n > 0
then [n mod 10]
else []
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (ListG EmptyG)

*)

(* changed exprs
Ite (Just (2,24)-(2,56)) (Bop (Just (2,27)-(2,32)) Gt (Var (Just (2,27)-(2,28)) "n") (Lit (Just (2,31)-(2,32)) (LI 0))) (List (Just (2,38)-(2,48)) [Bop (Just (2,39)-(2,47)) Mod (Var (Just (2,39)-(2,40)) "n") (Lit (Just (2,45)-(2,47)) (LI 10))] Nothing) (List (Just (2,54)-(2,56)) [] Nothing)
*)

(* typed spans
(2,24)-(2,56)
*)

(* correct types
int list
*)

(* bad types
int list
*)
