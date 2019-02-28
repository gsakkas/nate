
let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> (listHelper t h) :: l2 in
  listHelper l [];;


(* fix

let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> listHelper t (h :: l2) in
  listHelper l [];;

*)

(* changed spans
(4,38)-(4,60)
listHelper t (h :: l2)
AppG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG])))])

*)

(* changed exprs
App (Just (4,38)-(4,60)) (Var (Just (4,38)-(4,48)) "listHelper") [Var (Just (4,49)-(4,50)) "t",ConApp (Just (4,51)-(4,60)) "::" (Just (Tuple (Just (4,52)-(4,59)) [Var (Just (4,52)-(4,53)) "h",Var (Just (4,57)-(4,59)) "l2"])) Nothing]
*)

(* typed spans
(4,38)-(4,60)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
