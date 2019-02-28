
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l) tl;;


(* fix

let rec listReverse l =
  match l with | [] -> l | hd::tl -> listReverse (hd :: l);;

*)

(* changed spans
(3,38)-(3,62)
l
VarG

(3,38)-(3,49)
listReverse (hd :: l)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG])))])

*)

(* changed exprs
Var (Just (3,23)-(3,24)) "l"
App (Just (3,37)-(3,58)) (Var (Just (3,37)-(3,48)) "listReverse") [ConApp (Just (3,49)-(3,58)) "::" (Just (Tuple (Just (3,50)-(3,57)) [Var (Just (3,50)-(3,52)) "hd",Var (Just (3,56)-(3,57)) "l"])) Nothing]
*)

(* typed spans
(3,23)-(3,24)
(3,37)-(3,58)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list
'a list -> 'a list -> 'b list
*)
