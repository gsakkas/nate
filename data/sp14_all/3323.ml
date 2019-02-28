
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) :: 0) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) @ [0]) @ [h * i];;

*)

(* changed spans
(5,12)-(5,46)
mulByDigit i
           (List.rev t) @ [0]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (5,12)-(5,47)) (Var (Just (5,41)-(5,42)) "@") [App (Just (5,13)-(5,40)) (Var (Just (5,14)-(5,24)) "mulByDigit") [Var (Just (5,25)-(5,26)) "i",App (Just (5,27)-(5,39)) (Var (Just (5,28)-(5,36)) "List.rev") [Var (Just (5,37)-(5,38)) "t"]],List (Just (5,43)-(5,46)) [Lit (Just (5,44)-(5,45)) (LI 0)] Nothing]
*)

(* typed spans
(5,12)-(5,47)
*)

(* correct types
int list
*)

(* bad types
int list
*)
