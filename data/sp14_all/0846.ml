
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

let rec digitalRoot n = sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

let rec digitalRoot n = sumList (digitsOfInt n);;

*)

(* changed spans
(11,24)-(11,45)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (11,24)-(11,47)) (Var (Just (11,24)-(11,31)) "sumList") [App (Just (11,32)-(11,47)) (Var (Just (11,33)-(11,44)) "digitsOfInt") [Var (Just (11,45)-(11,46)) "n"]]
*)

(* typed spans
(11,24)-(11,47)
*)

(* correct types
int
*)

(* bad types
'a
*)
