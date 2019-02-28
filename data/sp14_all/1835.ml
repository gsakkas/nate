
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  let rec helper count x =
    match x with
    | [] -> count
    | hd::tl -> helper (count + 1) (sumList (digits n)) in
  helper 0;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  let rec helper count x =
    if x < 10 then count else helper (count + 1) (sumList (digits n)) in
  helper 0 n;;

*)

(* changed spans
(15,4)-(17,55)
if x < 10
then count
else helper (count + 1)
            (sumList (digits n))
IteG (BopG EmptyG EmptyG) VarG (AppG (fromList [EmptyG]))

(18,2)-(18,10)
helper 0 n
AppG (fromList [VarG,LitG])

*)

(* changed exprs
Ite (Just (15,4)-(15,69)) (Bop (Just (15,7)-(15,13)) Lt (Var (Just (15,7)-(15,8)) "x") (Lit (Just (15,11)-(15,13)) (LI 10))) (Var (Just (15,19)-(15,24)) "count") (App (Just (15,30)-(15,69)) (Var (Just (15,30)-(15,36)) "helper") [Bop (Just (15,37)-(15,48)) Plus (Var (Just (15,38)-(15,43)) "count") (Lit (Just (15,46)-(15,47)) (LI 1)),App (Just (15,49)-(15,69)) (Var (Just (15,50)-(15,57)) "sumList") [App (Just (15,58)-(15,68)) (Var (Just (15,59)-(15,65)) "digits") [Var (Just (15,66)-(15,67)) "n"]]])
App (Just (16,2)-(16,12)) (Var (Just (16,2)-(16,8)) "helper") [Lit (Just (16,9)-(16,10)) (LI 0),Var (Just (16,11)-(16,12)) "n"]
*)

(* typed spans
(15,4)-(15,69)
(16,2)-(16,12)
*)

(* correct types
int
int
*)

(* bad types
int
int -> int
*)
