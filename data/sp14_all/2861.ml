
let rec append first second =
  match first with | [] -> second | h::t -> h :: (append t second);;

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else append ((digitsOfInt (n / 10)) [n mod 10]);;


(* fix

let rec append first second =
  match first with | [] -> second | h::t -> h :: (append t second);;

let rec digitsOfInt n =
  if n < 0
  then []
  else if n = 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(8,29)-(8,71)
append (digitsOfInt (n / 10))
       [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (8,29)-(8,69)) (Var (Just (8,29)-(8,35)) "append") [App (Just (8,36)-(8,58)) (Var (Just (8,37)-(8,48)) "digitsOfInt") [Bop (Just (8,49)-(8,57)) Div (Var (Just (8,50)-(8,51)) "n") (Lit (Just (8,54)-(8,56)) (LI 10))],List (Just (8,59)-(8,69)) [Bop (Just (8,60)-(8,68)) Mod (Var (Just (8,60)-(8,61)) "n") (Lit (Just (8,66)-(8,68)) (LI 10))] Nothing]
*)

(* typed spans
(8,29)-(8,69)
*)

(* correct types
int list
*)

(* bad types
int list -> int list
*)
