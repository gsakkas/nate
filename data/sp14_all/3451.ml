
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let x = [0] in
  if (sumList (digitsOfInt n)) > 9
  then 1 :: (x additivePersistence (sumList (digitsOfInt n)))
  else sumList x;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let x = [0] in
  if (sumList (digitsOfInt n)) > 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else sumList x;;

*)

(* changed spans
(13,7)-(13,61)
1 :: x;
additivePersistence (sumList (digitsOfInt n))
SeqG (ConAppG (Just EmptyG)) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Seq (Just (13,7)-(13,62)) (ConApp (Just (13,8)-(13,14)) "::" (Just (Tuple (Just (13,8)-(13,14)) [Lit (Just (13,8)-(13,9)) (LI 1),Var (Just (13,13)-(13,14)) "x"])) Nothing) (App (Just (13,16)-(13,61)) (Var (Just (13,16)-(13,35)) "additivePersistence") [App (Just (13,36)-(13,61)) (Var (Just (13,37)-(13,44)) "sumList") [App (Just (13,45)-(13,60)) (Var (Just (13,46)-(13,57)) "digitsOfInt") [Var (Just (13,58)-(13,59)) "n"]]])
*)

(* typed spans
(13,7)-(13,62)
*)

(* correct types
int
*)

(* bad types
int list
*)
