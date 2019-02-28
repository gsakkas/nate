
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev l); h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev l)) @ [h * i];;

*)

(* changed spans
(5,12)-(5,46)
mulByDigit i
           (List.rev l) @ [h * i]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (5,12)-(5,49)) (Var (Just (5,40)-(5,41)) "@") [App (Just (5,12)-(5,39)) (Var (Just (5,13)-(5,23)) "mulByDigit") [Var (Just (5,24)-(5,25)) "i",App (Just (5,26)-(5,38)) (Var (Just (5,27)-(5,35)) "List.rev") [Var (Just (5,36)-(5,37)) "l"]],List (Just (5,42)-(5,49)) [Bop (Just (5,43)-(5,48)) Times (Var (Just (5,43)-(5,44)) "h") (Var (Just (5,47)-(5,48)) "i")] Nothing]
*)

(* typed spans
(5,12)-(5,49)
*)

(* correct types
int list
*)

(* bad types
int list
*)
