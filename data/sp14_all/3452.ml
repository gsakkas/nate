
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [];;

let rec additivePersistence n =
  1 @ x;
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n))
  else sumList x;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [];;

let rec additivePersistence n =
  [1; 2];
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n))
  else sumList x;;

*)

(* changed spans
(13,2)-(13,7)
[1 ; 2]
ListG LitG

*)

(* changed exprs
List (Just (13,2)-(13,8)) [Lit (Just (13,3)-(13,4)) (LI 1),Lit (Just (13,6)-(13,7)) (LI 2)] Nothing
*)

(* typed spans
(13,2)-(13,8)
*)

(* correct types
int list
*)

(* bad types
unit
*)
