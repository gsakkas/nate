
let rec lastListElement n =
  match n with
  | [] -> failwith "ERROR: List must be of size 1 or greater"
  | x::[] -> x
  | x::y -> lastListElement y;;

let rec popOffLast n =
  match n with | [] -> [] | x::[] -> [] | x::y -> x :: (popOffLast y);;

let rec catLists x y =
  if y = []
  then x
  else
    (match x with
     | [] -> y
     | x::[] -> x :: y
     | h::t -> catLists (popOffLast x) ((lastListElement x) :: y));;

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else digitsOfInt (catLists (n / 10) [n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,2)-(6,29)
EMPTY
EmptyG

(12,5)-(12,11)
EMPTY
EmptyG

(23,31)-(23,73)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(23,43)-(23,73)
EMPTY
EmptyG

*)

(* typed spans
(5,31)-(5,66)
*)

(* typed spans
int list
*)

(* typed spans
int list
*)
