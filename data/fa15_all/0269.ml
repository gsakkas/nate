
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [hd * i] @ [mulByDigit i tl];;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [hd * i] @ (mulByDigit i tl);;

*)

(* changed spans
(3,49)-(3,66)
mulByDigit i tl
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,49)-(3,66)) (Var (Just (3,50)-(3,60)) "mulByDigit") [Var (Just (3,61)-(3,62)) "i",Var (Just (3,63)-(3,65)) "tl"]
*)

(* typed spans
(3,49)-(3,66)
*)

(* correct types
int list
*)

(* bad types
int list
*)
