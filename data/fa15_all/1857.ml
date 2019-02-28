
let rec digitsOfIntHelper n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfIntHelper (n / 10));;

let rec listReverseHelper l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let rec digitsOfInt n = listReverseHelper (digitsOfIntHelper n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let rec count acc n =
    if (sumList (digits n)) mod (10 not 0) then acc else acc + 1 in
  count 1 n;;


(* fix

let rec digitsOfIntHelper n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfIntHelper (n / 10));;

let rec listReverseHelper l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let rec digitsOfInt n = listReverseHelper (digitsOfIntHelper n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let rec count acc n =
    if ((sumList (digits n)) mod 10) <> 0 then acc else acc + 1 in
  count 1 n;;

*)

(* changed spans
(21,7)-(21,42)
(sumList (digits n) mod 10) <> 0
BopG (BopG EmptyG EmptyG) LitG

*)

(* changed exprs
Bop (Just (21,7)-(21,41)) Neq (Bop (Just (21,7)-(21,36)) Mod (App (Just (21,8)-(21,28)) (Var (Just (21,9)-(21,16)) "sumList") [App (Just (21,17)-(21,27)) (Var (Just (21,18)-(21,24)) "digits") [Var (Just (21,25)-(21,26)) "n"]]) (Lit (Just (21,33)-(21,35)) (LI 10))) (Lit (Just (21,40)-(21,41)) (LI 0))
*)

(* typed spans
(21,7)-(21,41)
*)

(* correct types
bool
*)

(* bad types
int
*)
