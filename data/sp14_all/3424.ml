
let rec digitsOfInt n = (n mod 10) :: (if n > 0 then digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  let int list digInt = n mod 10 in
  if n > 0 then digitsOfInt (n / 10) else [];;

*)

(* changed spans
(2,24)-(2,74)
let int =
  fun list ->
    fun digInt -> n mod 10 in
if n > 0
then digitsOfInt (n / 10)
else []
LetG NonRec (fromList [LamG EmptyG]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(4,44)) NonRec [(VarPat (Just (3,6)-(3,9)) "int",Lam (Just (3,10)-(3,32)) (VarPat (Just (3,10)-(3,14)) "list") (Lam (Just (3,15)-(3,32)) (VarPat (Just (3,15)-(3,21)) "digInt") (Bop (Just (3,24)-(3,32)) Mod (Var (Just (3,24)-(3,25)) "n") (Lit (Just (3,30)-(3,32)) (LI 10))) Nothing) Nothing)] (Ite (Just (4,2)-(4,44)) (Bop (Just (4,5)-(4,10)) Gt (Var (Just (4,5)-(4,6)) "n") (Lit (Just (4,9)-(4,10)) (LI 0))) (App (Just (4,16)-(4,36)) (Var (Just (4,16)-(4,27)) "digitsOfInt") [Bop (Just (4,28)-(4,36)) Div (Var (Just (4,29)-(4,30)) "n") (Lit (Just (4,33)-(4,35)) (LI 10))]) (List (Just (4,42)-(4,44)) [] Nothing))
*)

(* typed spans
(3,2)-(4,44)
*)

(* correct types
'a list
*)

(* bad types
int list
*)
