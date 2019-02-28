
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in append digitsOfInt n2 [n2]);;


(* fix

let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in append (digitsOfInt n2) [n2]);;

*)

(* changed spans
(5,45)-(5,71)
append (digitsOfInt n2) [n2]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (5,45)-(5,73)) (Var (Just (5,45)-(5,51)) "append") [App (Just (5,52)-(5,68)) (Var (Just (5,53)-(5,64)) "digitsOfInt") [Var (Just (5,65)-(5,67)) "n2"],List (Just (5,69)-(5,73)) [Var (Just (5,70)-(5,72)) "n2"] Nothing]
*)

(* typed spans
(5,45)-(5,73)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
