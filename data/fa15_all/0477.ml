
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n = if (n / 10) <= 0 then 0 else digits n;;


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
(9,28)-(9,69)
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(9,61)-(9,67)
sumList
VarG

(9,61)-(9,67)
digits n
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (9,16)-(9,70)) (VarPat (Just (9,16)-(9,18)) "xs") (Case (Just (9,21)-(9,70)) (Var (Just (9,27)-(9,29)) "xs") [(ConPat (Just (9,37)-(9,39)) "[]" Nothing,Nothing,Lit (Just (9,43)-(9,44)) (LI 0)),(ConsPat (Just (9,47)-(9,51)) (VarPat (Just (9,47)-(9,48)) "h") (VarPat (Just (9,50)-(9,51)) "t"),Nothing,Bop (Just (9,55)-(9,70)) Plus (Var (Just (9,55)-(9,56)) "h") (App (Just (9,59)-(9,70)) (Var (Just (9,60)-(9,67)) "sumList") [Var (Just (9,68)-(9,69)) "t"]))]) Nothing
Var (Just (12,31)-(12,38)) "sumList"
App (Just (12,39)-(12,49)) (Var (Just (12,40)-(12,46)) "digits") [Var (Just (12,47)-(12,48)) "n"]
*)

(* typed spans
(9,16)-(9,70)
(12,31)-(12,38)
(12,39)-(12,49)
*)

(* correct types
int list -> int
int list -> int
int list
*)

(* bad types
int -> int list
int -> int list
int -> int list
*)
