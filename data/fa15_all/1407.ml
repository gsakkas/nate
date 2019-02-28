
let rec additivePersistence n = n = (additivePersistence (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = additivePersistence (sumList (digits n));;

*)

(* changed spans
(2,32)-(2,68)
if n <= 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (3,2)-(3,60)) (Bop (Just (3,5)-(3,11)) Le (Var (Just (3,5)-(3,6)) "n") (Lit (Just (3,10)-(3,11)) (LI 0))) (List (Just (3,17)-(3,19)) [] Nothing) (App (Just (3,25)-(3,60)) (Var (Just (3,48)-(3,49)) "@") [App (Just (3,25)-(3,47)) (Var (Just (3,26)-(3,37)) "digitsOfInt") [Bop (Just (3,38)-(3,46)) Div (Var (Just (3,39)-(3,40)) "n") (Lit (Just (3,43)-(3,45)) (LI 10))],List (Just (3,50)-(3,60)) [Bop (Just (3,51)-(3,59)) Mod (Var (Just (3,51)-(3,52)) "n") (Lit (Just (3,57)-(3,59)) (LI 10))] Nothing])
*)

(* typed spans
(3,2)-(3,60)
*)

(* correct types
int list
*)

(* bad types
bool
*)
