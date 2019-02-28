
let rec digitsOfInt n = if n <= 0 then [] else [n mod 10; digitsOfInt n];;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(2,24)-(2,72)
let myList = [] in
if n <= 0
then []
else (n mod 10) :: myList
LetG NonRec (fromList [ListG EmptyG]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(3,64)) NonRec [(VarPat (Just (3,6)-(3,12)) "myList",List (Just (3,15)-(3,17)) [] Nothing)] (Ite (Just (3,21)-(3,64)) (Bop (Just (3,24)-(3,30)) Le (Var (Just (3,24)-(3,25)) "n") (Lit (Just (3,29)-(3,30)) (LI 0))) (List (Just (3,36)-(3,38)) [] Nothing) (ConApp (Just (3,44)-(3,64)) "::" (Just (Tuple (Just (3,44)-(3,64)) [Bop (Just (3,44)-(3,54)) Mod (Var (Just (3,45)-(3,46)) "n") (Lit (Just (3,51)-(3,53)) (LI 10)),Var (Just (3,58)-(3,64)) "myList"])) Nothing))
*)

(* typed spans
(3,2)-(3,64)
*)

(* correct types
int list
*)

(* bad types
int list
*)
