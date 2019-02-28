
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: ([(digitsOfInt n) / 1] 0);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,2)-(3,63)
if n < 0
then print_int 0
else print_int (n / 10);
digitsOfInt (n / 10)
SeqG (IteG EmptyG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Seq (Just (3,2)-(3,73)) (Ite (Just (3,2)-(3,51)) (Bop (Just (3,5)-(3,10)) Lt (Var (Just (3,5)-(3,6)) "n") (Lit (Just (3,9)-(3,10)) (LI 0))) (App (Just (3,16)-(3,27)) (Var (Just (3,16)-(3,25)) "print_int") [Lit (Just (3,26)-(3,27)) (LI 0)]) (App (Just (3,33)-(3,51)) (Var (Just (3,33)-(3,42)) "print_int") [Bop (Just (3,43)-(3,51)) Div (Var (Just (3,44)-(3,45)) "n") (Lit (Just (3,48)-(3,50)) (LI 10))])) (App (Just (3,53)-(3,73)) (Var (Just (3,53)-(3,64)) "digitsOfInt") [Bop (Just (3,65)-(3,73)) Div (Var (Just (3,66)-(3,67)) "n") (Lit (Just (3,70)-(3,72)) (LI 10))])
*)

(* typed spans
(3,2)-(3,73)
*)

(* correct types
'a
*)

(* bad types
int list
*)
