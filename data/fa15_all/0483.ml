
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in (digitsOfInt n2) append [n2]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in digitsOfInt n2);;

*)

(* changed spans
(5,45)-(5,73)
digitsOfInt n2
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,45)-(3,59)) (Var (Just (3,45)-(3,56)) "digitsOfInt") [Var (Just (3,57)-(3,59)) "n2"]
*)

(* typed spans
(3,45)-(3,59)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
