
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ ((mulByDigit i x') :: x''));;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(6,50)-(6,76)
mulByDigit i [x'] @ x''
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (7,35)-(7,62)) (Var (Just (7,56)-(7,57)) "@") [App (Just (7,36)-(7,55)) (Var (Just (7,37)-(7,47)) "mulByDigit") [Var (Just (7,48)-(7,49)) "i",List (Just (7,50)-(7,54)) [Var (Just (7,51)-(7,53)) "x'"] Nothing],Var (Just (7,58)-(7,61)) "x''"]
*)

(* typed spans
(7,35)-(7,62)
*)

(* correct types
int list
*)

(* bad types
int list
*)
