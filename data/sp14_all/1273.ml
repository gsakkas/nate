
let digitsOfInt n =
  let rec lastDigit n acc =
    if n <= 0 then acc else lastDigit (n / 10) ((n mod 10) :: acc) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n count =
  match n with
  | [] -> count
  | _ -> additivePersistence (sumList (digitsOfInt n) (count + 1));;


(* fix

let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with | 0 -> 0 | _ -> additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(3,22)-(4,66)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
LamG (IteG EmptyG EmptyG EmptyG)

(9,30)-(12,66)
match n with
| 0 -> 0
| _ -> additivePersistence (sumList (digitsOfInt n))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

*)

(* changed exprs
Lam (Just (3,22)-(4,68)) (VarPat (Just (3,22)-(3,26)) "accu") (Ite (Just (4,4)-(4,68)) (Bop (Just (4,7)-(4,13)) Le (Var (Just (4,7)-(4,8)) "n") (Lit (Just (4,12)-(4,13)) (LI 0))) (Var (Just (4,19)-(4,23)) "accu") (App (Just (4,29)-(4,68)) (Var (Just (4,29)-(4,38)) "lastDigit") [Bop (Just (4,39)-(4,47)) Div (Var (Just (4,40)-(4,41)) "n") (Lit (Just (4,44)-(4,46)) (LI 10)),ConApp (Just (4,48)-(4,68)) "::" (Just (Tuple (Just (4,49)-(4,67)) [Bop (Just (4,49)-(4,59)) Mod (Var (Just (4,50)-(4,51)) "n") (Lit (Just (4,56)-(4,58)) (LI 10)),Var (Just (4,63)-(4,67)) "accu"])) Nothing])) Nothing
Case (Just (10,2)-(10,76)) (Var (Just (10,8)-(10,9)) "n") [(LitPat (Just (10,17)-(10,18)) (LI 0),Nothing,Lit (Just (10,22)-(10,23)) (LI 0)),(WildPat (Just (10,26)-(10,27)),Nothing,App (Just (10,31)-(10,76)) (Var (Just (10,31)-(10,50)) "additivePersistence") [App (Just (10,51)-(10,76)) (Var (Just (10,52)-(10,59)) "sumList") [App (Just (10,60)-(10,75)) (Var (Just (10,61)-(10,72)) "digitsOfInt") [Var (Just (10,73)-(10,74)) "n"]]])]
*)

(* typed spans
(3,22)-(4,68)
(10,2)-(10,76)
*)

(* correct types
int list -> int list
int
*)

(* bad types
int list -> int list
int -> int
*)
