
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [0];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else (1 :: x; sumList [x]);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else (1 :: x; sumList x);;

*)

(* changed spans
(10,8)-(10,11)
[]
ListG EmptyG

(15,24)-(15,27)
x
VarG

*)

(* changed exprs
List (Just (10,8)-(10,10)) [] Nothing
Var (Just (15,24)-(15,25)) "x"
*)

(* typed spans
(10,8)-(10,10)
(15,24)-(15,25)
*)

(* correct types
int list
int list
*)

(* bad types
int list
int list list
*)
