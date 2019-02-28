
let rec clone x n =
  let rec helper acc n' =
    if n <= 0 then [] else helper ((x :: acc), (n' - 1)) in
  helper [x] (n - 1);;


(* fix

let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else helper (x :: acc) (n' - 1) in
  helper [x] (n - 1);;

*)

(* changed spans
(4,27)-(4,56)
helper (x :: acc) (n' - 1)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

*)

(* changed exprs
App (Just (3,49)-(3,75)) (Var (Just (3,49)-(3,55)) "helper") [ConApp (Just (3,56)-(3,66)) "::" (Just (Tuple (Just (3,57)-(3,65)) [Var (Just (3,57)-(3,58)) "x",Var (Just (3,62)-(3,65)) "acc"])) Nothing,Bop (Just (3,67)-(3,75)) Minus (Var (Just (3,68)-(3,70)) "n'") (Lit (Just (3,73)-(3,74)) (LI 1))]
*)

(* typed spans
(3,49)-(3,75)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
