
let rec digOfIntHelper h = match h > 0 with | true  -> 1 | false  -> 0;;

let rec digitsOfInt n =
  match n > 0 with | true  -> [digOfIntHelper n; []; n mod 10] | false  -> [];;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt n)
       | true  -> digitsOfInt (n mod 10));;

*)

(* changed spans
(5,3)-(5,78)
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt n)
          | true -> digitsOfInt (n mod 10)
CaseG (fromList [(LitPatG,Nothing,CaseG (fromList [(LitPatG,Nothing,EmptyG)])),(LitPatG,Nothing,ListG (fromList []))])

(5,31)-(5,63)
[]
ListG (fromList [])

(5,76)-(5,78)
match n > 9 with
| false -> n :: (digitsOfInt n)
| true -> digitsOfInt (n mod 10)
CaseG (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(2,4)-(2,73)
(2,24)-(2,71)
(2,28)-(2,71)
(2,56)-(2,57)
(5,31)-(5,63)
(5,32)-(5,46)
(5,32)-(5,48)
(5,50)-(5,52)
*)
