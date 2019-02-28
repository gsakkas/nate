
let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) :: x);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ [x]);;

*)

(* changed spans
(3,45)-(3,65)
digitsOfInt n @ [x]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,45)-(3,66)) (Var (Just (3,61)-(3,62)) "@") [App (Just (3,45)-(3,60)) (Var (Just (3,46)-(3,57)) "digitsOfInt") [Var (Just (3,58)-(3,59)) "n"],List (Just (3,63)-(3,66)) [Var (Just (3,64)-(3,65)) "x"] Nothing]
*)

(* typed spans
(3,45)-(3,66)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
