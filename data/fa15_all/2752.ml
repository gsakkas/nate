
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let x l = List.map string_of_int;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [remainder x y] @ (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [remainder i h] @ (mulByDigit i t);;

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

(11,23)-(11,24)
EMPTY
EmptyG

(11,25)-(11,26)
i
VarG

(11,30)-(11,46)
h
VarG

*)
