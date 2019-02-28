
let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with | 0 -> 0 | _ -> additivePersistence sumList digitsOfInt n;;


(* fix

let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with | 0 -> 0 | _ -> additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(10,31)-(10,72)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (10,31)-(10,76)) (Var (Just (10,31)-(10,50)) "additivePersistence") [App (Just (10,51)-(10,76)) (Var (Just (10,52)-(10,59)) "sumList") [App (Just (10,60)-(10,75)) (Var (Just (10,61)-(10,72)) "digitsOfInt") [Var (Just (10,73)-(10,74)) "n"]]]
*)

(* typed spans
(10,31)-(10,76)
*)

(* correct types
int
*)

(* bad types
int
*)
