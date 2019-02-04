
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digit = digitsOfInt (n / 10) in digit @ [n mod 10]);;

*)

(* changed spans
(3,25)-(3,35)
EMPTY
EmptyG

(3,25)-(3,60)
EMPTY
EmptyG

(3,26)-(3,27)
EMPTY
EmptyG

(3,32)-(3,34)
EMPTY
EmptyG

(3,36)-(3,37)
EMPTY
EmptyG

(3,38)-(3,60)
let digit =
  digitsOfInt (n / 10) in
digit @ [n mod 10]
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

*)
