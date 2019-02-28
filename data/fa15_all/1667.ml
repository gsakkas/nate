
let rec mulByDigit i l =
  if i <= 0
  then []
  else (match l with | [] -> [] | h::t -> [h * i] @ (mulByDigit t));;


(* fix

let rec mulByDigit i l =
  if i <= 0
  then []
  else (match l with | [] -> [] | h::t -> [h * i] @ (mulByDigit i t));;

*)

(* changed spans
(5,52)-(5,66)
mulByDigit i t
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (5,52)-(5,68)) (Var (Just (5,53)-(5,63)) "mulByDigit") [Var (Just (5,64)-(5,65)) "i",Var (Just (5,66)-(5,67)) "t"]
*)

(* typed spans
(5,52)-(5,68)
*)

(* correct types
int list
*)

(* bad types
int list
*)
