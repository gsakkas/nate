
let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList n));;


(* fix

let rec append xs1 xs2 =
  match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n - ((n / 10) * 10)];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(2,16)-(2,74)
fun xs1 ->
  fun xs2 ->
    match xs1 with
    | [] -> xs2
    | hd :: tl -> hd :: (append tl
                                xs2)
LamG (LamG EmptyG)

(2,16)-(2,74)
fun n ->
  if n <= 0
  then []
  else append (digitsOfInt (n / 10))
              [n - ((n / 10) * 10)]
LamG (IteG EmptyG EmptyG EmptyG)

(2,16)-(2,74)
fun n -> digitsOfInt (abs n)
LamG (AppG (fromList [EmptyG]))

(5,58)-(5,59)
digits n
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (2,15)-(3,62)) (VarPat (Just (2,15)-(2,18)) "xs1") (Lam (Just (2,19)-(3,62)) (VarPat (Just (2,19)-(2,22)) "xs2") (Case (Just (3,2)-(3,62)) (Var (Just (3,8)-(3,11)) "xs1") [(ConPat (Just (3,19)-(3,21)) "[]" Nothing,Nothing,Var (Just (3,25)-(3,28)) "xs2"),(ConsPat (Just (3,31)-(3,37)) (VarPat (Just (3,31)-(3,33)) "hd") (VarPat (Just (3,35)-(3,37)) "tl"),Nothing,ConApp (Just (3,41)-(3,62)) "::" (Just (Tuple (Just (3,41)-(3,62)) [Var (Just (3,41)-(3,43)) "hd",App (Just (3,47)-(3,62)) (Var (Just (3,48)-(3,54)) "append") [Var (Just (3,55)-(3,57)) "tl",Var (Just (3,58)-(3,61)) "xs2"]])) Nothing)]) Nothing) Nothing
Lam (Just (5,20)-(6,76)) (VarPat (Just (5,20)-(5,21)) "n") (Ite (Just (6,2)-(6,76)) (Bop (Just (6,5)-(6,11)) Le (Var (Just (6,5)-(6,6)) "n") (Lit (Just (6,10)-(6,11)) (LI 0))) (List (Just (6,17)-(6,19)) [] Nothing) (App (Just (6,25)-(6,76)) (Var (Just (6,25)-(6,31)) "append") [App (Just (6,32)-(6,54)) (Var (Just (6,33)-(6,44)) "digitsOfInt") [Bop (Just (6,45)-(6,53)) Div (Var (Just (6,46)-(6,47)) "n") (Lit (Just (6,50)-(6,52)) (LI 10))],List (Just (6,55)-(6,76)) [Bop (Just (6,56)-(6,75)) Minus (Var (Just (6,56)-(6,57)) "n") (Bop (Just (6,60)-(6,75)) Times (Bop (Just (6,61)-(6,69)) Div (Var (Just (6,62)-(6,63)) "n") (Lit (Just (6,66)-(6,68)) (LI 10))) (Lit (Just (6,72)-(6,74)) (LI 10)))] Nothing])) Nothing
Lam (Just (8,11)-(8,34)) (VarPat (Just (8,11)-(8,12)) "n") (App (Just (8,15)-(8,34)) (Var (Just (8,15)-(8,26)) "digitsOfInt") [App (Just (8,27)-(8,34)) (Var (Just (8,28)-(8,31)) "abs") [Var (Just (8,32)-(8,33)) "n"]]) Nothing
App (Just (13,58)-(13,68)) (Var (Just (13,59)-(13,65)) "digits") [Var (Just (13,66)-(13,67)) "n"]
*)

(* typed spans
(2,15)-(3,62)
(5,20)-(6,76)
(8,11)-(8,34)
(13,58)-(13,68)
*)

(* correct types
int list -> int list -> int list
int -> int list
int -> int list
int list
*)

(* bad types
int list -> int
int list -> int
int list -> int
int
*)
