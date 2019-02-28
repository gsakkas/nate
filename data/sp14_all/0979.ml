
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    if (n mod 10) = 0
    then 0 :: (digitsOfInt (n / 10))
    else if ((n - 1) mod 10) = 0 then 1 :: (digitsOfInt ((n - 1) / 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let rec digits n digitList =
       if n = 0 then digitList else digits (n / 10) ((n mod 10) :: digitList) in
     match n with | 0 -> [0] | _ -> digits n []);;

*)

(* changed spans
(3,5)-(3,11)
n < 0
BopG VarG LitG

(6,4)-(8,71)
let rec digits =
  fun n ->
    fun digitList ->
      if n = 0
      then digitList
      else digits (n / 10)
                  ((n mod 10) :: digitList) in
match n with
| 0 -> [0]
| _ -> digits n []
LetG Rec (fromList [LamG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(6,7)-(6,17)
n
VarG

(7,9)-(7,36)
digitList
VarG

(7,15)-(7,26)
digits (n / 10)
       ((n mod 10) :: digitList)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

(8,9)-(8,71)
(n mod 10) :: digitList
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG])))

(8,25)-(8,27)
match n with
| 0 -> [0]
| _ -> digits n []
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

(8,38)-(8,71)
digits n []
AppG (fromList [VarG,ListG EmptyG])

(8,9)-(8,71)
[]
ListG EmptyG

*)

(* changed exprs
Bop (Just (3,5)-(3,10)) Lt (Var (Just (3,5)-(3,6)) "n") (Lit (Just (3,9)-(3,10)) (LI 0))
Let (Just (6,4)-(8,48)) Rec [(VarPat (Just (6,13)-(6,19)) "digits",Lam (Just (6,20)-(7,77)) (VarPat (Just (6,20)-(6,21)) "n") (Lam (Just (6,22)-(7,77)) (VarPat (Just (6,22)-(6,31)) "digitList") (Ite (Just (7,7)-(7,77)) (Bop (Just (7,10)-(7,15)) Eq (Var (Just (7,10)-(7,11)) "n") (Lit (Just (7,14)-(7,15)) (LI 0))) (Var (Just (7,21)-(7,30)) "digitList") (App (Just (7,36)-(7,77)) (Var (Just (7,36)-(7,42)) "digits") [Bop (Just (7,43)-(7,51)) Div (Var (Just (7,44)-(7,45)) "n") (Lit (Just (7,48)-(7,50)) (LI 10)),ConApp (Just (7,52)-(7,77)) "::" (Just (Tuple (Just (7,53)-(7,76)) [Bop (Just (7,53)-(7,63)) Mod (Var (Just (7,54)-(7,55)) "n") (Lit (Just (7,60)-(7,62)) (LI 10)),Var (Just (7,67)-(7,76)) "digitList"])) Nothing])) Nothing) Nothing)] (Case (Just (8,5)-(8,47)) (Var (Just (8,11)-(8,12)) "n") [(LitPat (Just (8,20)-(8,21)) (LI 0),Nothing,List (Just (8,25)-(8,28)) [Lit (Just (8,26)-(8,27)) (LI 0)] Nothing),(WildPat (Just (8,31)-(8,32)),Nothing,App (Just (8,36)-(8,47)) (Var (Just (8,36)-(8,42)) "digits") [Var (Just (8,43)-(8,44)) "n",List (Just (8,45)-(8,47)) [] Nothing])])
Var (Just (7,10)-(7,11)) "n"
Var (Just (7,21)-(7,30)) "digitList"
App (Just (7,36)-(7,77)) (Var (Just (7,36)-(7,42)) "digits") [Bop (Just (7,43)-(7,51)) Div (Var (Just (7,44)-(7,45)) "n") (Lit (Just (7,48)-(7,50)) (LI 10)),ConApp (Just (7,52)-(7,77)) "::" (Just (Tuple (Just (7,53)-(7,76)) [Bop (Just (7,53)-(7,63)) Mod (Var (Just (7,54)-(7,55)) "n") (Lit (Just (7,60)-(7,62)) (LI 10)),Var (Just (7,67)-(7,76)) "digitList"])) Nothing]
ConApp (Just (7,52)-(7,77)) "::" (Just (Tuple (Just (7,53)-(7,76)) [Bop (Just (7,53)-(7,63)) Mod (Var (Just (7,54)-(7,55)) "n") (Lit (Just (7,60)-(7,62)) (LI 10)),Var (Just (7,67)-(7,76)) "digitList"])) Nothing
Case (Just (8,5)-(8,47)) (Var (Just (8,11)-(8,12)) "n") [(LitPat (Just (8,20)-(8,21)) (LI 0),Nothing,List (Just (8,25)-(8,28)) [Lit (Just (8,26)-(8,27)) (LI 0)] Nothing),(WildPat (Just (8,31)-(8,32)),Nothing,App (Just (8,36)-(8,47)) (Var (Just (8,36)-(8,42)) "digits") [Var (Just (8,43)-(8,44)) "n",List (Just (8,45)-(8,47)) [] Nothing])]
App (Just (8,36)-(8,47)) (Var (Just (8,36)-(8,42)) "digits") [Var (Just (8,43)-(8,44)) "n",List (Just (8,45)-(8,47)) [] Nothing]
List (Just (8,45)-(8,47)) [] Nothing
*)

(* typed spans
(3,5)-(3,10)
(6,4)-(8,48)
(7,10)-(7,11)
(7,21)-(7,30)
(7,36)-(7,77)
(7,52)-(7,77)
(8,5)-(8,47)
(8,36)-(8,47)
(8,45)-(8,47)
*)

(* correct types
bool
int list
int
int list
int list
int list
int list
int list
int list
*)

(* bad types
bool
unit
int
int list
int -> int list
unit
int
int list
unit
*)
