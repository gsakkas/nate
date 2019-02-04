
let x l = List.map string_of_int;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with | [] -> [] | h::t -> (mulByDigit i t) @ [x * y]);;


(* fix

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with | [] -> [] | h::t -> (mulByDigit i t) @ [h * i]);;

*)

(* changed spans
(2,6)-(2,32)
EMPTY
EmptyG

(2,10)-(2,18)
EMPTY
EmptyG

(2,10)-(2,32)
EMPTY
EmptyG

(2,19)-(2,32)
EMPTY
EmptyG

(4,8)-(4,17)
EMPTY
EmptyG

(4,9)-(4,10)
EMPTY
EmptyG

(4,12)-(4,13)
EMPTY
EmptyG

(4,15)-(4,16)
EMPTY
EmptyG

(10,68)-(10,69)
EMPTY
EmptyG

(10,72)-(10,73)
h
VarG

*)
