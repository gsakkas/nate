
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: ((digitsOfInt n) * 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(3,39)-(3,61)
digitsOfInt n
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,25)-(3,61)
(3,39)-(3,61)
(3,40)-(3,55)
(3,41)-(3,52)
*)
