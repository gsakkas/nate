
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 10 then 1 + additivePersistence else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let x = sumList (digits n) in
  if x > 10 then 1 + (additivePersistence x) else 0;;

*)

(* changed spans
(5,16)-(5,70)
fun n -> digitsOfInt (abs n)
LamG (AppG (fromList [EmptyG]))

(8,2)-(8,71)
let x = sumList (digits n) in
if x > 10
then 1 + additivePersistence x
else 0
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(8,15)-(8,26)
digits
VarG

(8,33)-(8,35)
if x > 10
then 1 + additivePersistence x
else 0
IteG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG) LitG

(8,45)-(8,64)
additivePersistence x
AppG (fromList [VarG])

(8,70)-(8,71)
x
VarG

*)

(* typed spans
(5,11)-(5,34)
(10,2)-(11,51)
(10,19)-(10,25)
(11,2)-(11,51)
(11,21)-(11,44)
(11,42)-(11,43)
*)

(* typed spans
int -> int list
int
int -> int list
int
int
int
*)

(* typed spans
int list -> int
int
int -> int list
int
int
int
*)
