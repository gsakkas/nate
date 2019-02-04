
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else if n > 0 then myAppend [digitsOfInt (n / 10)] (n mod 10) else [];;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

*)

(* changed spans
(5,2)-(7,71)
EMPTY
EmptyG

(5,5)-(5,6)
EMPTY
EmptyG

(5,5)-(5,10)
EMPTY
EmptyG

(5,9)-(5,10)
EMPTY
EmptyG

(6,7)-(6,10)
EMPTY
EmptyG

(6,8)-(6,9)
EMPTY
EmptyG

(7,7)-(7,71)
EMPTY
EmptyG

(7,10)-(7,15)
match n with
| 0 -> []
| _ -> myAppend (getDigits (n / 10))
                (n mod 10)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(7,14)-(7,15)
[]
ListG EmptyG Nothing

(7,30)-(7,52)
EMPTY
EmptyG

(7,31)-(7,42)
getDigits
VarG

(7,69)-(7,71)
fun n ->
  if n = 0
  then [0]
  else getDigits n
LamG (IteG EmptyG EmptyG EmptyG)

*)
