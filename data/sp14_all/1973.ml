
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  match n with | 0 -> 1 | _ -> 1 + (additivePersistence sumList digits n);;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  match n with | 0 -> 1 | _ -> 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(14,35)-(14,73)
additivePersistence (sumList (digits n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (14,35)-(14,77)) (Var (Just (14,36)-(14,55)) "additivePersistence") [App (Just (14,56)-(14,76)) (Var (Just (14,57)-(14,64)) "sumList") [App (Just (14,65)-(14,75)) (Var (Just (14,66)-(14,72)) "digits") [Var (Just (14,73)-(14,74)) "n"]]]
*)

(* typed spans
(14,35)-(14,77)
*)

(* correct types
int
*)

(* bad types
int
*)
