
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then (app digitsOfInt n) / (10 [n mod 10]) else app [3] [8];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10)) [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,18)-(5,55)
app (digitsOfInt (n / 10))
    [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (5,18)-(5,55)) (Var (Just (5,18)-(5,21)) "app") [App (Just (5,22)-(5,44)) (Var (Just (5,23)-(5,34)) "digitsOfInt") [Bop (Just (5,35)-(5,43)) Div (Var (Just (5,36)-(5,37)) "n") (Lit (Just (5,40)-(5,42)) (LI 10))],List (Just (5,45)-(5,55)) [Bop (Just (5,46)-(5,54)) Mod (Var (Just (5,46)-(5,47)) "n") (Lit (Just (5,52)-(5,54)) (LI 10))] Nothing]
*)

(* typed spans
(5,18)-(5,55)
*)

(* correct types
int list
*)

(* bad types
int
*)
