
let digitsOfInt n =
  let rec lastDigit n acc =
    if n <= 0 then acc else lastDigit (n / 10) ((n mod 10) :: acc) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n count =
  match n with
  | 0 -> count
  | _ -> additivePersistence ((sumList (digitsOfInt n)) (count + 1));;


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
(3,22)-(4,66)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
LamG (IteG EmptyG EmptyG EmptyG)

(4,19)-(4,22)
accu
VarG

(4,62)-(4,65)
accu
VarG

(9,30)-(12,68)
EMPTY
EmptyG

(11,9)-(11,14)
0
LitG

(12,30)-(12,55)
EMPTY
EmptyG

(12,56)-(12,67)
EMPTY
EmptyG

(12,57)-(12,62)
EMPTY
EmptyG

(12,65)-(12,66)
EMPTY
EmptyG

*)
