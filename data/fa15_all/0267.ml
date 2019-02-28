
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ ([hd] * i);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ [hd * i];;

*)

(* changed spans
(3,58)-(3,68)
[hd * i]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (3,58)-(3,66)) [Bop (Just (3,59)-(3,65)) Times (Var (Just (3,59)-(3,61)) "hd") (Var (Just (3,64)-(3,65)) "i")] Nothing
*)

(* typed spans
(3,58)-(3,66)
*)

(* correct types
int list
*)

(* bad types
int
*)
