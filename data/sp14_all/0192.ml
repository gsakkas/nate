
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l) tl;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l);;

*)

(* changed spans
(3,38)-(3,62)
listReverse (hd :: l)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG])))])

*)

(* changed exprs
App (Just (3,38)-(3,59)) (Var (Just (3,38)-(3,49)) "listReverse") [ConApp (Just (3,50)-(3,59)) "::" (Just (Tuple (Just (3,51)-(3,58)) [Var (Just (3,51)-(3,53)) "hd",Var (Just (3,57)-(3,58)) "l"])) Nothing]
*)

(* typed spans
(3,38)-(3,59)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
