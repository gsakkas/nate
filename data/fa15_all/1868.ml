
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,24)-(2,40)
if n < 10
then [n]
else digitsOfInt (n / 10)
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (3,24)-(3,68)) (Bop (Just (3,27)-(3,33)) Lt (Var (Just (3,27)-(3,28)) "n") (Lit (Just (3,31)-(3,33)) (LI 10))) (List (Just (3,39)-(3,42)) [Var (Just (3,40)-(3,41)) "n"] Nothing) (App (Just (3,48)-(3,68)) (Var (Just (3,48)-(3,59)) "digitsOfInt") [Bop (Just (3,60)-(3,68)) Div (Var (Just (3,61)-(3,62)) "n") (Lit (Just (3,65)-(3,67)) (LI 10))])
*)

(* typed spans
(3,24)-(3,68)
*)

(* correct types
int list
*)

(* bad types
unit
*)
