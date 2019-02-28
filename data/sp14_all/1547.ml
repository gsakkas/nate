
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let rec digHelper n = if n < 10 then n else digHelper (sumList n) in
  digHelper n;;


(* fix

let digitsOfInt n =
  let rec digitsHelper n l =
    if n = 0 then l else digitsHelper (n / 10) ((n mod 10) :: l) in
  if n <= 0 then [] else digitsHelper n [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let rec digHelper n =
    if n < 10 then n else digHelper (sumList (digitsOfInt n)) in
  digHelper n;;

*)

(* changed spans
(2,16)-(2,70)
fun n ->
  (let rec digitsHelper =
     fun n ->
       fun l ->
         if n = 0
         then l
         else digitsHelper (n / 10)
                           ((n mod 10) :: l) in
   if n <= 0
   then []
   else digitsHelper n [])
LamG (LetG Rec (fromList [EmptyG]) EmptyG)

(5,65)-(5,66)
digitsOfInt n
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (2,16)-(5,42)) (VarPat (Just (2,16)-(2,17)) "n") (Let (Just (3,2)-(5,42)) Rec [(VarPat (Just (3,10)-(3,22)) "digitsHelper",Lam (Just (3,23)-(4,64)) (VarPat (Just (3,23)-(3,24)) "n") (Lam (Just (3,25)-(4,64)) (VarPat (Just (3,25)-(3,26)) "l") (Ite (Just (4,4)-(4,64)) (Bop (Just (4,7)-(4,12)) Eq (Var (Just (4,7)-(4,8)) "n") (Lit (Just (4,11)-(4,12)) (LI 0))) (Var (Just (4,18)-(4,19)) "l") (App (Just (4,25)-(4,64)) (Var (Just (4,25)-(4,37)) "digitsHelper") [Bop (Just (4,38)-(4,46)) Div (Var (Just (4,39)-(4,40)) "n") (Lit (Just (4,43)-(4,45)) (LI 10)),ConApp (Just (4,47)-(4,64)) "::" (Just (Tuple (Just (4,48)-(4,63)) [Bop (Just (4,48)-(4,58)) Mod (Var (Just (4,49)-(4,50)) "n") (Lit (Just (4,55)-(4,57)) (LI 10)),Var (Just (4,62)-(4,63)) "l"])) Nothing])) Nothing) Nothing)] (Ite (Just (5,2)-(5,42)) (Bop (Just (5,5)-(5,11)) Le (Var (Just (5,5)-(5,6)) "n") (Lit (Just (5,10)-(5,11)) (LI 0))) (List (Just (5,17)-(5,19)) [] Nothing) (App (Just (5,25)-(5,42)) (Var (Just (5,25)-(5,37)) "digitsHelper") [Var (Just (5,38)-(5,39)) "n",List (Just (5,40)-(5,42)) [] Nothing]))) Nothing
App (Just (11,45)-(11,60)) (Var (Just (11,46)-(11,57)) "digitsOfInt") [Var (Just (11,58)-(11,59)) "n"]
*)

(* typed spans
(2,16)-(5,42)
(11,45)-(11,60)
*)

(* correct types
int -> int list
int list
*)

(* bad types
int list -> int
int
*)
