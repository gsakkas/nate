
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then h * i
      else (remainder h y) @ (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else [remainder i h] @ (mulByDigit i t);;

*)

(* changed spans
(11,12)-(11,17)
[h * i] @ mulByDigit i t
AppG [ListG [EmptyG],AppG [EmptyG,EmptyG]]

(12,12)-(12,27)
[remainder i h]
ListG [AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,4)-(2,65)
(2,15)-(2,63)
(2,17)-(2,63)
(2,24)-(2,31)
(2,29)-(2,30)
(4,4)-(4,20)
(4,9)-(4,18)
(10,7)-(12,46)
(11,12)-(11,17)
(12,12)-(12,27)
(12,12)-(12,46)
(12,13)-(12,22)
(12,25)-(12,26)
(12,28)-(12,29)
*)
