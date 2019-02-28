
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n > 9 then (additivePersistence sumList (digitsOfInt n)) + 1 else 0;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n > 9 then (additivePersistence (sumList (digitsOfInt n))) + 1 else 0;;

*)

(* changed spans
(13,16)-(13,61)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (13,16)-(13,63)) (Var (Just (13,17)-(13,36)) "additivePersistence") [App (Just (13,37)-(13,62)) (Var (Just (13,38)-(13,45)) "sumList") [App (Just (13,46)-(13,61)) (Var (Just (13,47)-(13,58)) "digitsOfInt") [Var (Just (13,59)-(13,60)) "n"]]]
*)

(* typed spans
(13,16)-(13,63)
*)

(* correct types
int
*)

(* bad types
int
*)
