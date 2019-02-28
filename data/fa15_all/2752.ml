
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

(11,23)-(11,24)
i
VarG

(11,30)-(11,46)
h
VarG

*)

(* typed spans
(7,23)-(7,24)
(7,25)-(7,26)
*)

(* typed spans
int
int
*)

(* typed spans
'a -> int list -> string list
'a list
*)
