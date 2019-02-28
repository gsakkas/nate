
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ [x'']));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(7,58)-(7,63)
x''
VarG

*)

(* changed exprs
Var (Just (7,58)-(7,61)) "x''"
*)

(* typed spans
(7,58)-(7,61)
*)

(* correct types
int list
*)

(* bad types
int list list
*)
