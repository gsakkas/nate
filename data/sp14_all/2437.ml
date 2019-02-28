
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then ((0 :: l1), (0 :: l2))
    else ([l1], [l2]);;


(* fix

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2) then ((0 :: l1), l2) else (l1, l2);;

*)

(* changed spans
(3,5)-(3,40)
List.length l1 > List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(4,12)-(4,14)
0 :: l2
ConAppG (Just (TupleG (fromList [VarG,LitG])))

(7,21)-(7,30)
l2
VarG

(8,10)-(8,14)
l1
VarG

(8,16)-(8,20)
l2
VarG

*)

(* changed exprs
Bop (Just (3,5)-(3,40)) Gt (App (Just (3,5)-(3,21)) (Var (Just (3,6)-(3,17)) "List.length") [Var (Just (3,18)-(3,20)) "l1"]) (App (Just (3,24)-(3,40)) (Var (Just (3,25)-(3,36)) "List.length") [Var (Just (3,37)-(3,39)) "l2"])
ConApp (Just (4,12)-(4,21)) "::" (Just (Tuple (Just (4,13)-(4,20)) [Lit (Just (4,13)-(4,14)) (LI 0),Var (Just (4,18)-(4,20)) "l2"])) Nothing
Var (Just (6,60)-(6,62)) "l2"
Var (Just (6,70)-(6,72)) "l1"
Var (Just (6,74)-(6,76)) "l2"
*)

(* typed spans
(3,5)-(3,40)
(4,12)-(4,21)
(6,60)-(6,62)
(6,70)-(6,72)
(6,74)-(6,76)
*)

(* correct types
bool
int list
int list
int list
int list
*)

(* bad types
bool
int list
int list
int list list
int list list
*)
