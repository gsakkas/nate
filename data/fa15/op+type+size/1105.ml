
let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in
  match n with
  | _ when n <= 0 -> []
  | _ when n > 0 -> (digitsOfInt r) @ digit;;


(* fix

let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in
  match n with
  | _ when n <= 0 -> []
  | _ when n > 0 -> (digitsOfInt r) @ [digit];;

*)

(* changed spans
(7,38)-(7,43)
*)

(* type error slice
(3,2)-(7,43)
(3,14)-(3,22)
(7,20)-(7,43)
(7,36)-(7,37)
(7,38)-(7,43)
*)

(* all spans
(2,20)-(7,43)
(3,2)-(7,43)
(3,14)-(3,22)
(3,14)-(3,15)
(3,20)-(3,22)
(4,10)-(4,16)
(4,10)-(4,11)
(4,14)-(4,16)
(5,2)-(7,43)
(5,8)-(5,9)
(6,21)-(6,23)
(7,20)-(7,43)
(7,36)-(7,37)
(7,20)-(7,35)
(7,21)-(7,32)
(7,33)-(7,34)
(7,38)-(7,43)
*)
