
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [0];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else 1 :: x;
  sumList x;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let x = [0];;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else sumList x;;

*)

(* changed spans
(13,2)-(16,11)
if sumList (digitsOfInt n) < 9
then (1 :: x;
additivePersistence (sumList (digitsOfInt n)))
else sumList x
IteG (BopG EmptyG EmptyG) (SeqG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (13,2)-(15,16)) (Bop (Just (13,5)-(13,34)) Lt (App (Just (13,5)-(13,30)) (Var (Just (13,6)-(13,13)) "sumList") [App (Just (13,14)-(13,29)) (Var (Just (13,15)-(13,26)) "digitsOfInt") [Var (Just (13,27)-(13,28)) "n"]]) (Lit (Just (13,33)-(13,34)) (LI 9))) (Seq (Just (14,7)-(14,62)) (ConApp (Just (14,8)-(14,14)) "::" (Just (Tuple (Just (14,8)-(14,14)) [Lit (Just (14,8)-(14,9)) (LI 1),Var (Just (14,13)-(14,14)) "x"])) Nothing) (App (Just (14,16)-(14,61)) (Var (Just (14,16)-(14,35)) "additivePersistence") [App (Just (14,36)-(14,61)) (Var (Just (14,37)-(14,44)) "sumList") [App (Just (14,45)-(14,60)) (Var (Just (14,46)-(14,57)) "digitsOfInt") [Var (Just (14,58)-(14,59)) "n"]]])) (App (Just (15,7)-(15,16)) (Var (Just (15,7)-(15,14)) "sumList") [Var (Just (15,15)-(15,16)) "x"])
*)

(* typed spans
(13,2)-(15,16)
*)

(* correct types
int
*)

(* bad types
int
*)
