
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let x l = List.map string_of_int;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (match l with
     | [] -> []
     | h::t ->
         if (List.length t) > 1
         then (remainder i h) :: (mulByDigit i t)
         else [x * y]);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (match l with
     | [] -> []
     | h::t ->
         if (List.length t) > 1
         then (remainder i h) :: (mulByDigit i t)
         else [i * h]);;

*)

(* changed spans
(4,6)-(4,32)
EMPTY
EmptyG

(4,10)-(4,18)
EMPTY
EmptyG

(4,10)-(4,32)
EMPTY
EmptyG

(4,19)-(4,32)
EMPTY
EmptyG

(6,8)-(6,17)
EMPTY
EmptyG

(6,9)-(6,10)
EMPTY
EmptyG

(6,12)-(6,13)
EMPTY
EmptyG

(6,15)-(6,16)
EMPTY
EmptyG

(17,15)-(17,16)
EMPTY
EmptyG

(17,19)-(17,20)
i
VarG

*)
