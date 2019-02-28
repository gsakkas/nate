
let rec digitsOfInt n =
  let rec integers a b =
    match a with | [] -> b | x::xs -> integers xs ((a mod 10) :: b) in
  integers n [];;


(* fix

let rec digitsOfInt n =
  let rec integers a b =
    if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
  integers n [];;

*)

(* changed spans
(4,4)-(4,67)
if a = 0
then b
else integers (a / 10)
              ((a mod 10) :: b)
IteG (BopG EmptyG EmptyG) VarG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (4,4)-(4,60)) (Bop (Just (4,7)-(4,12)) Eq (Var (Just (4,7)-(4,8)) "a") (Lit (Just (4,11)-(4,12)) (LI 0))) (Var (Just (4,18)-(4,19)) "b") (App (Just (4,25)-(4,60)) (Var (Just (4,25)-(4,33)) "integers") [Bop (Just (4,34)-(4,42)) Div (Var (Just (4,35)-(4,36)) "a") (Lit (Just (4,39)-(4,41)) (LI 10)),ConApp (Just (4,43)-(4,60)) "::" (Just (Tuple (Just (4,44)-(4,59)) [Bop (Just (4,44)-(4,54)) Mod (Var (Just (4,45)-(4,46)) "a") (Lit (Just (4,51)-(4,53)) (LI 10)),Var (Just (4,58)-(4,59)) "b"])) Nothing])
*)

(* typed spans
(4,4)-(4,60)
*)

(* correct types
int list
*)

(* bad types
int list
*)
