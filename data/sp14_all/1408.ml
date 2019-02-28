
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (match n with
     | 0 -> [0]
     | _ ->
         if (n / 10) != 0
         then (digitsOfInt (n / 10)) @ [n mod 10]
         else [n mod 10]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then 0
  else 1 + (additivePersistence sumList n);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (match n with
     | 0 -> [0]
     | _ ->
         if (n / 10) != 0
         then (digitsOfInt (n / 10)) @ [n mod 10]
         else [n mod 10]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then 0
  else 1 + (additivePersistence (sumList (digitsOfInt n)));;

*)

(* changed spans
(18,11)-(18,42)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (18,11)-(18,58)) (Var (Just (18,12)-(18,31)) "additivePersistence") [App (Just (18,32)-(18,57)) (Var (Just (18,33)-(18,40)) "sumList") [App (Just (18,41)-(18,56)) (Var (Just (18,42)-(18,53)) "digitsOfInt") [Var (Just (18,54)-(18,55)) "n"]]]
*)

(* typed spans
(18,11)-(18,58)
*)

(* correct types
int
*)

(* bad types
int
*)
