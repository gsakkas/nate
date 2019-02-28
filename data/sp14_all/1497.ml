
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x abs n;;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

*)

(* changed spans
(7,2)-(7,21)
clonehelper x (abs n)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (7,2)-(7,23)) (Var (Just (7,2)-(7,13)) "clonehelper") [Var (Just (7,14)-(7,15)) "x",App (Just (7,16)-(7,23)) (Var (Just (7,17)-(7,20)) "abs") [Var (Just (7,21)-(7,22)) "n"]]
*)

(* typed spans
(7,2)-(7,23)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
