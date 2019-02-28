
let rec clone x n = match n with | 1 -> [x] | n' -> [clone x (n - 1)];;


(* fix

let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append (clone x (n - 1)) [];;

*)

(* changed spans
(2,52)-(2,69)
List.append (clone x (n - 1))
            []
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,34)-(3,66)) (Var (Just (3,34)-(3,45)) "List.append") [App (Just (3,46)-(3,63)) (Var (Just (3,47)-(3,52)) "clone") [Var (Just (3,53)-(3,54)) "x",Bop (Just (3,55)-(3,62)) Minus (Var (Just (3,56)-(3,57)) "n") (Lit (Just (3,60)-(3,61)) (LI 1))],List (Just (3,64)-(3,66)) [] Nothing]
*)

(* typed spans
(3,34)-(3,66)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
