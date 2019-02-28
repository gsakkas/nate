
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9
  then sumList (sumList (digitsOfInt (digitsOfInt n)))
  else 1;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9
  then sumList (digitsOfInt (sumList (digitsOfInt n)))
  else 1;;

*)

(* changed spans
(14,24)-(14,53)
digitsOfInt
VarG

(14,24)-(14,53)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

(14,24)-(14,53)
sumList
VarG

(14,38)-(14,49)
digitsOfInt n
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (14,16)-(14,27)) "digitsOfInt"
App (Just (14,28)-(14,53)) (Var (Just (14,29)-(14,36)) "sumList") [App (Just (14,37)-(14,52)) (Var (Just (14,38)-(14,49)) "digitsOfInt") [Var (Just (14,50)-(14,51)) "n"]]
Var (Just (14,29)-(14,36)) "sumList"
App (Just (14,37)-(14,52)) (Var (Just (14,38)-(14,49)) "digitsOfInt") [Var (Just (14,50)-(14,51)) "n"]
*)

(* typed spans
(14,16)-(14,27)
(14,28)-(14,53)
(14,29)-(14,36)
(14,37)-(14,52)
*)

(* correct types
int -> int list
int
int list -> int
int list
*)

(* bad types
int list
int list
int list
int -> int list
*)
