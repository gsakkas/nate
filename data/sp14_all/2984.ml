
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app ([n / 10] [n mod 10]) else app [3] [8];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n = if n >= 10 then app [5] [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,18)-(5,43)
app [5] [n mod 10]
AppG (fromList [ListG EmptyG])

*)

(* changed exprs
App (Just (4,40)-(4,58)) (Var (Just (4,40)-(4,43)) "app") [List (Just (4,44)-(4,47)) [Lit (Just (4,45)-(4,46)) (LI 5)] Nothing,List (Just (4,48)-(4,58)) [Bop (Just (4,49)-(4,57)) Mod (Var (Just (4,49)-(4,50)) "n") (Lit (Just (4,55)-(4,57)) (LI 10))] Nothing]
*)

(* typed spans
(4,40)-(4,58)
*)

(* correct types
int list
*)

(* bad types
int list -> int list
*)
