
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) * 10) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev t)) @ [h * i];;

*)

(* changed spans
(5,12)-(5,46)
mulByDigit i (List.rev t)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (5,12)-(5,39)) (Var (Just (5,13)-(5,23)) "mulByDigit") [Var (Just (5,24)-(5,25)) "i",App (Just (5,26)-(5,38)) (Var (Just (5,27)-(5,35)) "List.rev") [Var (Just (5,36)-(5,37)) "t"]]
*)

(* typed spans
(5,12)-(5,39)
*)

(* correct types
int list
*)

(* bad types
int
*)
