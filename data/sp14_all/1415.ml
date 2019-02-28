
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) :: ((n mod 10) []);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n x = if n = 0 then x else loop (n / 10) ((n mod 10) :: x) in
     match n with | 0 -> [0] | _ -> loop n []);;

*)

(* changed spans
(3,24)-(3,65)
let rec loop =
  fun n ->
    fun x ->
      if n = 0
      then x
      else loop (n / 10)
                ((n mod 10) :: x) in
match n with
| 0 -> [0]
| _ -> loop n []
LetG Rec (fromList [LamG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Let (Just (6,4)-(7,46)) Rec [(VarPat (Just (6,13)-(6,17)) "loop",Lam (Just (6,18)-(6,76)) (VarPat (Just (6,18)-(6,19)) "n") (Lam (Just (6,20)-(6,76)) (VarPat (Just (6,20)-(6,21)) "x") (Ite (Just (6,24)-(6,76)) (Bop (Just (6,27)-(6,32)) Eq (Var (Just (6,27)-(6,28)) "n") (Lit (Just (6,31)-(6,32)) (LI 0))) (Var (Just (6,38)-(6,39)) "x") (App (Just (6,45)-(6,76)) (Var (Just (6,45)-(6,49)) "loop") [Bop (Just (6,50)-(6,58)) Div (Var (Just (6,51)-(6,52)) "n") (Lit (Just (6,55)-(6,57)) (LI 10)),ConApp (Just (6,59)-(6,76)) "::" (Just (Tuple (Just (6,60)-(6,75)) [Bop (Just (6,60)-(6,70)) Mod (Var (Just (6,61)-(6,62)) "n") (Lit (Just (6,67)-(6,69)) (LI 10)),Var (Just (6,74)-(6,75)) "x"])) Nothing])) Nothing) Nothing)] (Case (Just (7,5)-(7,45)) (Var (Just (7,11)-(7,12)) "n") [(LitPat (Just (7,20)-(7,21)) (LI 0),Nothing,List (Just (7,25)-(7,28)) [Lit (Just (7,26)-(7,27)) (LI 0)] Nothing),(WildPat (Just (7,31)-(7,32)),Nothing,App (Just (7,36)-(7,45)) (Var (Just (7,36)-(7,40)) "loop") [Var (Just (7,41)-(7,42)) "n",List (Just (7,43)-(7,45)) [] Nothing])])
*)

(* typed spans
(6,4)-(7,46)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
