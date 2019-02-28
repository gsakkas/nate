
let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let m = reverseInt n in
     let x = m / 10
     and y = m mod 10 in
     if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;


(* fix

let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = (reverseInt n 0) / 10
     and y = (reverseInt n 0) mod 10 in
     if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;

*)

(* changed spans
(9,4)-(12,61)
let x = reverseInt n 0 / 10
and y =
  reverseInt n 0 mod 10 in
if (x = 0) && (y = 0)
then []
else y :: (digitsOfInt x)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (9,4)-(11,61)) NonRec [(VarPat (Just (9,9)-(9,10)) "x",Bop (Just (9,13)-(9,34)) Div (App (Just (9,13)-(9,29)) (Var (Just (9,14)-(9,24)) "reverseInt") [Var (Just (9,25)-(9,26)) "n",Lit (Just (9,27)-(9,28)) (LI 0)]) (Lit (Just (9,32)-(9,34)) (LI 10))),(VarPat (Just (10,9)-(10,10)) "y",Bop (Just (10,13)-(10,36)) Mod (App (Just (10,13)-(10,29)) (Var (Just (10,14)-(10,24)) "reverseInt") [Var (Just (10,25)-(10,26)) "n",Lit (Just (10,27)-(10,28)) (LI 0)]) (Lit (Just (10,34)-(10,36)) (LI 10)))] (Ite (Just (11,5)-(11,60)) (Bop (Just (11,8)-(11,26)) And (Bop (Just (11,8)-(11,15)) Eq (Var (Just (11,9)-(11,10)) "x") (Lit (Just (11,13)-(11,14)) (LI 0))) (Bop (Just (11,19)-(11,26)) Eq (Var (Just (11,20)-(11,21)) "y") (Lit (Just (11,24)-(11,25)) (LI 0)))) (List (Just (11,32)-(11,34)) [] Nothing) (ConApp (Just (11,40)-(11,60)) "::" (Just (Tuple (Just (11,40)-(11,60)) [Var (Just (11,40)-(11,41)) "y",App (Just (11,45)-(11,60)) (Var (Just (11,46)-(11,57)) "digitsOfInt") [Var (Just (11,58)-(11,59)) "x"]])) Nothing))
*)

(* typed spans
(9,4)-(11,61)
*)

(* correct types
int list
*)

(* bad types
int list
*)
