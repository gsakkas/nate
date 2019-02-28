
let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else listReverse ([n mod 10] append digitsOfInt (n / 10));;


(* fix

let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse (append [n mod 10] (digitsOfInt (n / 10)));;

*)

(* changed spans
(9,37)-(9,77)
append [n mod 10]
       (digitsOfInt (n / 10))
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (11,19)-(11,61)) (Var (Just (11,20)-(11,26)) "append") [List (Just (11,27)-(11,37)) [Bop (Just (11,28)-(11,36)) Mod (Var (Just (11,28)-(11,29)) "n") (Lit (Just (11,34)-(11,36)) (LI 10))] Nothing,App (Just (11,38)-(11,60)) (Var (Just (11,39)-(11,50)) "digitsOfInt") [Bop (Just (11,51)-(11,59)) Div (Var (Just (11,52)-(11,53)) "n") (Lit (Just (11,56)-(11,58)) (LI 10))]]
*)

(* typed spans
(11,19)-(11,61)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
