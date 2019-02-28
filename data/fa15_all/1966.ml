
let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> [h * i] @ (0 * (mulByDigit i t));;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> [h * i] @ (mulByDigit i t);;

*)

(* changed spans
(3,46)-(3,68)
mulByDigit i t
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,46)-(3,62)) (Var (Just (3,47)-(3,57)) "mulByDigit") [Var (Just (3,58)-(3,59)) "i",Var (Just (3,60)-(3,61)) "t"]
*)

(* typed spans
(3,46)-(3,62)
*)

(* correct types
int list
*)

(* bad types
int
*)
