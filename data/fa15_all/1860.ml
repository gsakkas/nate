
let rec intToReverseList n =
  if n <= 0 then [] else (n mod 10) :: (intToReverseList (n / 10));;

let rec listReverseHelper l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let rec digitsOfInt n = listReverseHelper (intToReverseList n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let rec count acc n =
    if n < 10 then acc else count (acc + 1) sumList (digits n) in
  count 0 n;;


(* fix

let rec intToReverseList n =
  if n <= 0 then [] else (n mod 10) :: (intToReverseList (n / 10));;

let rec listReverseHelper l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let rec digitsOfInt n = listReverseHelper (intToReverseList n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let rec count acc n =
    if n < 10 then acc else count (acc + 1) (sumList (digits n)) in
  count 0 n;;

*)

(* changed spans
(21,28)-(21,62)
count (acc + 1)
      (sumList (digits n))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (21,28)-(21,64)) (Var (Just (21,28)-(21,33)) "count") [Bop (Just (21,34)-(21,43)) Plus (Var (Just (21,35)-(21,38)) "acc") (Lit (Just (21,41)-(21,42)) (LI 1)),App (Just (21,44)-(21,64)) (Var (Just (21,45)-(21,52)) "sumList") [App (Just (21,53)-(21,63)) (Var (Just (21,54)-(21,60)) "digits") [Var (Just (21,61)-(21,62)) "n"]]]
*)

(* typed spans
(21,28)-(21,64)
*)

(* correct types
int
*)

(* bad types
int
*)
