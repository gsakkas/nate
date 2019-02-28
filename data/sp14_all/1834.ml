
let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append (t [h]);;


(* fix

let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append t [h];;

*)

(* changed spans
(5,58)-(5,72)
append t [h]
AppG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
App (Just (5,58)-(5,70)) (Var (Just (5,58)-(5,64)) "append") [Var (Just (5,65)-(5,66)) "t",List (Just (5,67)-(5,70)) [Var (Just (5,68)-(5,69)) "h"] Nothing]
*)

(* typed spans
(5,58)-(5,70)
*)

(* correct types
'a list
*)

(* bad types
'a list -> 'a list
*)
