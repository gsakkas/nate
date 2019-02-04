
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n mod 10); []];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,75)
let myList = [] in
if n <= 0
then []
else if n < 10
     then [n]
     else digitsOfInt (n / 10) @ [n mod 10]
LetG NonRec (fromList [ListG EmptyG Nothing]) (IteG EmptyG EmptyG EmptyG)

(2,47)-(2,75)
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

(2,48)-(2,70)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(2,60)-(2,70)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(2,72)-(2,74)
EMPTY
EmptyG

*)
