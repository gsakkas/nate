
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n acc =
       if n = 0 then acc else loop (n / 10) ((n mod 10) :: acc) in
     match n with | 0 -> [0] | _ -> loop n []);;

*)

(* changed spans
(2,24)-(2,40)
let rec loop =
  fun n ->
    fun acc ->
      if n = 0
      then acc
      else loop (n / 10)
                ((n mod 10) :: acc) in
match n with
| 0 -> [0]
| _ -> loop n []
LetG Rec (fromList [LamG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Let (Just (6,4)-(8,46)) Rec [(VarPat (Just (6,13)-(6,17)) "loop",Lam (Just (6,18)-(7,63)) (VarPat (Just (6,18)-(6,19)) "n") (Lam (Just (6,20)-(7,63)) (VarPat (Just (6,20)-(6,23)) "acc") (Ite (Just (7,7)-(7,63)) (Bop (Just (7,10)-(7,15)) Eq (Var (Just (7,10)-(7,11)) "n") (Lit (Just (7,14)-(7,15)) (LI 0))) (Var (Just (7,21)-(7,24)) "acc") (App (Just (7,30)-(7,63)) (Var (Just (7,30)-(7,34)) "loop") [Bop (Just (7,35)-(7,43)) Div (Var (Just (7,36)-(7,37)) "n") (Lit (Just (7,40)-(7,42)) (LI 10)),ConApp (Just (7,44)-(7,63)) "::" (Just (Tuple (Just (7,45)-(7,62)) [Bop (Just (7,45)-(7,55)) Mod (Var (Just (7,46)-(7,47)) "n") (Lit (Just (7,52)-(7,54)) (LI 10)),Var (Just (7,59)-(7,62)) "acc"])) Nothing])) Nothing) Nothing)] (Case (Just (8,5)-(8,45)) (Var (Just (8,11)-(8,12)) "n") [(LitPat (Just (8,20)-(8,21)) (LI 0),Nothing,List (Just (8,25)-(8,28)) [Lit (Just (8,26)-(8,27)) (LI 0)] Nothing),(WildPat (Just (8,31)-(8,32)),Nothing,App (Just (8,36)-(8,45)) (Var (Just (8,36)-(8,40)) "loop") [Var (Just (8,41)-(8,42)) "n",List (Just (8,43)-(8,45)) [] Nothing])])
*)

(* typed spans
(6,4)-(8,46)
*)

(* correct types
int list
*)

(* bad types
unit
*)
