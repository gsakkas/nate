
let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,3)-(3,65)
if n <= 0
then []
else (n mod 10) :: (digitsOfInt (n / 10))
IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (ConAppG (Just EmptyG))

*)

(* type error slice
(2,4)-(3,67)
(2,21)-(3,65)
(3,3)-(3,65)
(3,23)-(3,25)
(3,33)-(3,65)
(3,34)-(3,45)
(3,34)-(3,54)
(3,56)-(3,64)
*)
