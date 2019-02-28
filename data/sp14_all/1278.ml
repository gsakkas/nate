
let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec lengthOfList xs count =
  match xs with | [] -> 0 | hd::tl -> (lengthOfList tl count) + 1;;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with
  | 0 -> 0
  | _ ->
      if not ((lengthOfList digitsOfInt n) = 1)
      then additivePersistence (sumList (digitsOfInt n))
      else 4;;


(* fix

let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec lengthOfList xs count =
  match xs with | [] -> 0 | hd::tl -> (lengthOfList tl count) + 1;;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with
  | 0 -> 0
  | _ ->
      if not ((lengthOfList (digitsOfInt n) 0) = 1)
      then additivePersistence (sumList (digitsOfInt n))
      else 4;;

*)

(* changed spans
(16,28)-(16,39)
digitsOfInt n
AppG (fromList [VarG])

(16,45)-(16,46)
0
LitG

*)

(* changed exprs
App (Just (16,28)-(16,43)) (Var (Just (16,29)-(16,40)) "digitsOfInt") [Var (Just (16,41)-(16,42)) "n"]
Lit (Just (16,44)-(16,45)) (LI 0)
*)

(* typed spans
(16,28)-(16,43)
(16,44)-(16,45)
*)

(* correct types
int list
int
*)

(* bad types
int -> int list
int
*)
