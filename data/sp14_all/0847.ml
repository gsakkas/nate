
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec digitalRoot n = if n < 10 then n else digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

let rec digitalRoot n = sumList (digitsOfInt n);;

*)

(* changed spans
(8,20)-(8,59)
fun xs ->
  match xs with
  | [] -> 0
  | xs -> List.hd xs + sumList (List.tl xs)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,24)-(8,59)
EMPTY
EmptyG

(8,27)-(8,28)
EMPTY
EmptyG

(8,27)-(8,33)
EMPTY
EmptyG

(8,31)-(8,33)
EMPTY
EmptyG

(8,39)-(8,40)
EMPTY
EmptyG

(8,46)-(8,57)
digitsOfInt n
AppG (fromList [VarG])

*)
