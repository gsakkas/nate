
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n = if n > 9 then digitalRoot (sumList n) else n;;


(* fix

let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n > 9 then digitalRoot (sumList (digitsOfInt n)) else n;;

*)

(* changed spans
(2,16)-(2,70)
fun l ->
  match l with
  | [] -> []
  | h :: t -> append (listReverse t)
                     [h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(4,59)-(4,60)
digitsOfInt n
AppG (fromList [VarG])

*)
