
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ ((mulByDigit i x') @ x''));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(6,65)-(6,67)
[x']
ListG VarG

*)

(* changed exprs
List (Just (7,50)-(7,54)) [Var (Just (7,51)-(7,53)) "x'"] Nothing
*)

(* typed spans
(7,50)-(7,54)
*)

(* correct types
int list
*)

(* bad types
int
*)
