
let rec clone x n =
  let acc = [] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n =
  let acc = [] in if n > 0 then clone (x @ acc) (n - 1) else [];;

*)

(* changed spans
(3,38)-(3,48)
x @ acc
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,38)-(3,47)) (Var (Just (3,41)-(3,42)) "@") [Var (Just (3,39)-(3,40)) "x",Var (Just (3,43)-(3,46)) "acc"]
*)

(* typed spans
(3,38)-(3,47)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
