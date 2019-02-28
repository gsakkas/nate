
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i [x' :: x'']));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(6,51)-(6,61)
(@)
VarG

(6,51)-(6,61)
mulByDigit i [x']
AppG (fromList [VarG,ListG EmptyG])

(6,65)-(6,74)
x'
VarG

(6,65)-(6,74)
x''
VarG

*)

(* changed exprs
Var (Just (7,56)-(7,57)) "@"
App (Just (7,36)-(7,55)) (Var (Just (7,37)-(7,47)) "mulByDigit") [Var (Just (7,48)-(7,49)) "i",List (Just (7,50)-(7,54)) [Var (Just (7,51)-(7,53)) "x'"] Nothing]
Var (Just (7,51)-(7,53)) "x'"
Var (Just (7,58)-(7,61)) "x''"
*)

(* typed spans
(7,56)-(7,57)
(7,36)-(7,55)
(7,51)-(7,53)
(7,58)-(7,61)
*)

(* correct types
int list -> int list -> int list
int list
int
int list
*)

(* bad types
int -> int list list -> int list
int -> int list list -> int list
int list
int list
*)
