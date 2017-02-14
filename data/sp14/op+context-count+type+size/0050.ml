
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      ((mulByDigit m) :: t) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;

*)

(* changed spans
(6,6)-(6,27)
(6,7)-(6,21)
(6,19)-(6,20)
*)

(* type error slice
(2,3)-(7,61)
(2,19)-(7,59)
(2,21)-(7,59)
(3,2)-(7,59)
(6,6)-(6,27)
(6,6)-(6,27)
(6,6)-(7,59)
(6,7)-(6,21)
(6,8)-(6,18)
(6,28)-(6,29)
*)
