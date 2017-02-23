
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x' -> [(x * i) / 10] @ [((x * i) mod 10) + (mulByDigit i x')];;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,2)-(5,68)
(5,30)-(5,68)
(5,50)-(5,67)
(5,51)-(5,61)
(5,62)-(5,63)
*)

(* type error slice
(2,3)-(5,70)
(2,19)-(5,68)
(2,21)-(5,68)
(3,2)-(5,68)
(5,13)-(5,68)
(5,28)-(5,29)
(5,31)-(5,67)
(5,50)-(5,67)
(5,51)-(5,61)
*)

(* all spans
(2,19)-(5,68)
(2,21)-(5,68)
(3,2)-(5,68)
(3,8)-(3,9)
(4,10)-(4,12)
(5,13)-(5,68)
(5,28)-(5,29)
(5,13)-(5,27)
(5,14)-(5,26)
(5,14)-(5,21)
(5,15)-(5,16)
(5,19)-(5,20)
(5,24)-(5,26)
(5,30)-(5,68)
(5,31)-(5,67)
(5,31)-(5,47)
(5,32)-(5,39)
(5,33)-(5,34)
(5,37)-(5,38)
(5,44)-(5,46)
(5,50)-(5,67)
(5,51)-(5,61)
(5,62)-(5,63)
(5,64)-(5,66)
*)
