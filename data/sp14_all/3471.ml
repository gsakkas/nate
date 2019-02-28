
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (List.rev digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (List.rev (digitsOfInt (n / 10)));;

*)

(* changed spans
(3,39)-(3,70)
List.rev (digitsOfInt (n / 10))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,39)-(3,72)) (Var (Just (3,40)-(3,48)) "List.rev") [App (Just (3,49)-(3,71)) (Var (Just (3,50)-(3,61)) "digitsOfInt") [Bop (Just (3,62)-(3,70)) Div (Var (Just (3,63)-(3,64)) "n") (Lit (Just (3,67)-(3,69)) (LI 10))]]
*)

(* typed spans
(3,39)-(3,72)
*)

(* correct types
int list
*)

(* bad types
int list
*)
