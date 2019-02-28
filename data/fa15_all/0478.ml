
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = if (n / 10) <= 0 then 0 else sumList digits n;;


(* fix

let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0 then 0 else sumList (digits n);;

*)

(* changed spans
(11,61)-(11,77)
sumList (digits n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (12,31)-(12,49)) (Var (Just (12,31)-(12,38)) "sumList") [App (Just (12,39)-(12,49)) (Var (Just (12,40)-(12,46)) "digits") [Var (Just (12,47)-(12,48)) "n"]]
*)

(* typed spans
(12,31)-(12,49)
*)

(* correct types
int
*)

(* bad types
int
*)
