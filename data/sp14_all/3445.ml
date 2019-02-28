
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = [0] in
  if (sumList (digitsOfInt n)) > 9
  then 1 :: (count additivePersistence (sumList (digitsOfInt n)))
  else sumList count;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = [0] in
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n))
  else sumList count;;

*)

(* changed spans
(13,7)-(13,65)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (13,7)-(13,52)) (Var (Just (13,7)-(13,26)) "additivePersistence") [App (Just (13,27)-(13,52)) (Var (Just (13,28)-(13,35)) "sumList") [App (Just (13,36)-(13,51)) (Var (Just (13,37)-(13,48)) "digitsOfInt") [Var (Just (13,49)-(13,50)) "n"]]]
*)

(* typed spans
(13,7)-(13,52)
*)

(* correct types
int
*)

(* bad types
int list
*)
