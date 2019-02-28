
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t [h]);;


(* fix

let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append [h] [h];;

*)

(* changed spans
(5,36)-(5,62)
append [h] [h]
AppG (fromList [ListG EmptyG])

*)

(* changed exprs
App (Just (4,58)-(4,72)) (Var (Just (4,58)-(4,64)) "append") [List (Just (4,65)-(4,68)) [Var (Just (4,66)-(4,67)) "h"] Nothing,List (Just (4,69)-(4,72)) [Var (Just (4,70)-(4,71)) "h"] Nothing]
*)

(* typed spans
(4,58)-(4,72)
*)

(* correct types
'a list
*)

(* bad types
'a list -> 'a list
*)
