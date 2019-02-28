
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9
  then
    ((print_string "going into then") / (print_newline ());
     1
     ::
     x;
     additivePersistence (sumList (digitsOfInt n)))
  else (1 :: x; sumList x);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9
  then
    (print_string "going into then";
     1
     ::
     x;
     additivePersistence (sumList (digitsOfInt n)))
  else (1 :: x; sumList x);;

*)

(* changed spans
(15,5)-(15,58)
print_string "going into then"
AppG (fromList [LitG])

*)

(* changed exprs
App (Just (15,5)-(15,35)) (Var (Just (15,5)-(15,17)) "print_string") [Lit (Just (15,18)-(15,35)) (LS "going into then")]
*)

(* typed spans
(15,5)-(15,35)
*)

(* correct types
unit
*)

(* bad types
int
*)
