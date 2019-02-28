
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
(17,19)-(17,20)
i
VarG

(17,19)-(17,20)
h
VarG

*)

(* changed exprs
Var (Just (13,15)-(13,16)) "i"
Var (Just (13,19)-(13,20)) "h"
*)

(* typed spans
(13,15)-(13,16)
(13,19)-(13,20)
*)

(* correct types
int
int
*)

(* bad types
int list
int list
*)
