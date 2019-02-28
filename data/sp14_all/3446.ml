
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
  let x = 1 in
  x + 1;
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n))
  else x;;

*)

(* changed spans
(11,2)-(14,20)
let x = 1 in
(x + 1;
if sumList (digitsOfInt n) > 9
then additivePersistence (sumList (digitsOfInt n))
else x)
LetG NonRec (fromList [LitG]) (SeqG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (11,2)-(15,8)) NonRec [(VarPat (Just (11,6)-(11,7)) "x",Lit (Just (11,10)-(11,11)) (LI 1))] (Seq (Just (12,2)-(15,8)) (Bop (Just (12,2)-(12,7)) Plus (Var (Just (12,2)-(12,3)) "x") (Lit (Just (12,6)-(12,7)) (LI 1))) (Ite (Just (13,2)-(15,8)) (Bop (Just (13,5)-(13,34)) Gt (App (Just (13,5)-(13,30)) (Var (Just (13,6)-(13,13)) "sumList") [App (Just (13,14)-(13,29)) (Var (Just (13,15)-(13,26)) "digitsOfInt") [Var (Just (13,27)-(13,28)) "n"]]) (Lit (Just (13,33)-(13,34)) (LI 9))) (App (Just (14,7)-(14,52)) (Var (Just (14,7)-(14,26)) "additivePersistence") [App (Just (14,27)-(14,52)) (Var (Just (14,28)-(14,35)) "sumList") [App (Just (14,36)-(14,51)) (Var (Just (14,37)-(14,48)) "digitsOfInt") [Var (Just (14,49)-(14,50)) "n"]]]) (Var (Just (15,7)-(15,8)) "x")))
*)

(* typed spans
(11,2)-(15,8)
*)

(* correct types
int
*)

(* bad types
int
*)
