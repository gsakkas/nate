
let rec mulByDigit i l =
  let f a xs =
    let (a1,a2) = a in
    let h::t = xs in
    let val1 = (h * i) + a1 in
    if val1 > 9
    then ((val1 / 10), ((val1 mod 10) :: a2))
    else (0, (val1 :: a2)) in
  let base = (0, []) in
  let args = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec mulByDigit i l =
  let f a x =
    let (a1,a2) = a in
    let val1 = (x * i) + a1 in
    if val1 > 9
    then ((val1 / 10), ((val1 mod 10) :: a2))
    else (0, (val1 :: a2)) in
  let base = (0, []) in
  let args = 0 :: (List.rev l) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(3,10)-(9,26)
fun x ->
  (let (a1 , a2) = a in
   let val1 = (x * i) + a1 in
   if val1 > 9
   then (val1 / 10 , (val1 mod 10) :: a2)
   else (0 , val1 :: a2))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(11,13)-(11,30)
0 :: (List.rev l)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),LitG])))

(11,13)-(11,30)
0
LitG

(11,13)-(11,30)
List.rev l
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (3,10)-(8,26)) (VarPat (Just (3,10)-(3,11)) "x") (Let (Just (4,4)-(8,26)) NonRec [(TuplePat (Just (4,9)-(4,14)) [VarPat (Just (4,9)-(4,11)) "a1",VarPat (Just (4,12)-(4,14)) "a2"],Var (Just (4,18)-(4,19)) "a")] (Let (Just (5,4)-(8,26)) NonRec [(VarPat (Just (5,8)-(5,12)) "val1",Bop (Just (5,15)-(5,27)) Plus (Bop (Just (5,15)-(5,22)) Times (Var (Just (5,16)-(5,17)) "x") (Var (Just (5,20)-(5,21)) "i")) (Var (Just (5,25)-(5,27)) "a1"))] (Ite (Just (6,4)-(8,26)) (Bop (Just (6,7)-(6,15)) Gt (Var (Just (6,7)-(6,11)) "val1") (Lit (Just (6,14)-(6,15)) (LI 9))) (Tuple (Just (7,9)-(7,45)) [Bop (Just (7,10)-(7,21)) Div (Var (Just (7,11)-(7,15)) "val1") (Lit (Just (7,18)-(7,20)) (LI 10)),ConApp (Just (7,23)-(7,44)) "::" (Just (Tuple (Just (7,24)-(7,43)) [Bop (Just (7,24)-(7,37)) Mod (Var (Just (7,25)-(7,29)) "val1") (Lit (Just (7,34)-(7,36)) (LI 10)),Var (Just (7,41)-(7,43)) "a2"])) Nothing]) (Tuple (Just (8,9)-(8,26)) [Lit (Just (8,10)-(8,11)) (LI 0),ConApp (Just (8,13)-(8,25)) "::" (Just (Tuple (Just (8,14)-(8,24)) [Var (Just (8,14)-(8,18)) "val1",Var (Just (8,22)-(8,24)) "a2"])) Nothing])))) Nothing
ConApp (Just (10,13)-(10,30)) "::" (Just (Tuple (Just (10,13)-(10,30)) [Lit (Just (10,13)-(10,14)) (LI 0),App (Just (10,18)-(10,30)) (Var (Just (10,19)-(10,27)) "List.rev") [Var (Just (10,28)-(10,29)) "l"]])) Nothing
Lit (Just (10,13)-(10,14)) (LI 0)
App (Just (10,18)-(10,30)) (Var (Just (10,19)-(10,27)) "List.rev") [Var (Just (10,28)-(10,29)) "l"]
*)

(* typed spans
(3,10)-(8,26)
(10,13)-(10,30)
(10,13)-(10,14)
(10,18)-(10,30)
*)

(* correct types
int -> (int * int list)
int list
int
int list
*)

(* bad types
int list -> (int * int list)
int list
int list
int list
*)
