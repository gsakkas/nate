
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = 1 in if (sumList (digitsOfInt n)) > 9 then count = (count + 1);;


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
(11,14)-(11,15)
[0]
ListG LitG

(11,57)-(11,76)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

(11,66)-(11,71)
sumList count
AppG (fromList [VarG])

*)

(* changed exprs
List (Just (11,14)-(11,17)) [Lit (Just (11,15)-(11,16)) (LI 0)] Nothing
App (Just (13,7)-(13,52)) (Var (Just (13,7)-(13,26)) "additivePersistence") [App (Just (13,27)-(13,52)) (Var (Just (13,28)-(13,35)) "sumList") [App (Just (13,36)-(13,51)) (Var (Just (13,37)-(13,48)) "digitsOfInt") [Var (Just (13,49)-(13,50)) "n"]]]
App (Just (14,7)-(14,20)) (Var (Just (14,7)-(14,14)) "sumList") [Var (Just (14,15)-(14,20)) "count"]
*)

(* typed spans
(11,14)-(11,17)
(13,7)-(13,52)
(14,7)-(14,20)
*)

(* correct types
int list
int
int
*)

(* bad types
int
bool
int
*)
