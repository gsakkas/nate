
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let rec loop n a = if n = 0 then a else loop (n / 10) ((n mod 10) :: a) in
     match n with | 0 -> [0] | _ -> loop n []);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else n = (sumList (digitsOfInt n));;


(* fix

let a = int_of_char '3';;

let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let rec loop n a = if n = 0 then a else loop (n / 10) ((n mod 10) :: a) in
     match n with | 0 -> [0] | _ -> loop n []);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then a else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(2,20)-(7,46)
int_of_char '3'
AppG (fromList [LitG])

(12,17)-(12,18)
EMPTY
EmptyG

(12,24)-(12,25)
a
VarG

(12,24)-(12,53)
EMPTY
EmptyG

(12,29)-(12,36)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

*)
