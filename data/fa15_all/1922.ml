
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: ([(digitsOfInt n) / 1] 0);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,3)-(3,64)
if n < 0
then print_int 0
else print_int (n / 10);
digitsOfInt (n / 10)
SeqG (IteG EmptyG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(3,66)
(2,21)-(3,64)
(3,3)-(3,64)
(3,25)-(3,64)
(3,39)-(3,64)
(3,40)-(3,61)
(3,41)-(3,56)
(3,41)-(3,60)
(3,42)-(3,53)
*)
