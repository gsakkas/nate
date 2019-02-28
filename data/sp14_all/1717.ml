
let rec digitsOfInt n = (n mod 10) @ [(digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(2,24)-(2,59)
if n <= 0
then []
else [n mod 10] @ digitsOfInt (n / 10)
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (3,2)-(3,60)) (Bop (Just (3,5)-(3,11)) Le (Var (Just (3,5)-(3,6)) "n") (Lit (Just (3,10)-(3,11)) (LI 0))) (List (Just (3,17)-(3,19)) [] Nothing) (App (Just (3,25)-(3,60)) (Var (Just (3,36)-(3,37)) "@") [List (Just (3,25)-(3,35)) [Bop (Just (3,26)-(3,34)) Mod (Var (Just (3,26)-(3,27)) "n") (Lit (Just (3,32)-(3,34)) (LI 10))] Nothing,App (Just (3,38)-(3,60)) (Var (Just (3,39)-(3,50)) "digitsOfInt") [Bop (Just (3,51)-(3,59)) Div (Var (Just (3,52)-(3,53)) "n") (Lit (Just (3,56)-(3,58)) (LI 10))]])
*)

(* typed spans
(3,2)-(3,60)
*)

(* correct types
int list
*)

(* bad types
int
*)
