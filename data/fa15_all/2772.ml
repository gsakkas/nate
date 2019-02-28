
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
(10,72)-(10,73)
h
VarG

(10,72)-(10,73)
i
VarG

*)

(* changed exprs
Var (Just (6,68)-(6,69)) "h"
Var (Just (6,72)-(6,73)) "i"
*)

(* typed spans
(6,68)-(6,69)
(6,72)-(6,73)
*)

(* correct types
int
int
*)

(* bad types
int list
int list
*)
