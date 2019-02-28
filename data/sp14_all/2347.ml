
let padZero l1 l2 =
  let a = List.length l1 in let b = List.length l2 in if a < b then a;;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

*)

(* changed spans
(2,12)-(3,69)
fun x ->
  fun n ->
    (let accum = [] in
     let rec helper =
       fun accum ->
         fun n ->
           if n < 1
           then accum
           else helper (x :: accum)
                       (n - 1) in
     helper accum n)
LamG (LamG EmptyG)

(3,2)-(3,69)
let (a , b) =
  (List.length l1 , List.length l2) in
if a < b
then (List.append (clone 0
                         (b - a)) l1 , l2)
else if b < a
     then (l1 , List.append (clone 0
                                   (a - b)) l2)
     else (l1 , l2)
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Lam (Just (2,14)-(6,16)) (VarPat (Just (2,14)-(2,15)) "x") (Lam (Just (2,16)-(6,16)) (VarPat (Just (2,16)-(2,17)) "n") (Let (Just (3,2)-(6,16)) NonRec [(VarPat (Just (3,6)-(3,11)) "accum",List (Just (3,14)-(3,16)) [] Nothing)] (Let (Just (4,2)-(6,16)) Rec [(VarPat (Just (4,10)-(4,16)) "helper",Lam (Just (4,17)-(5,56)) (VarPat (Just (4,17)-(4,22)) "accum") (Lam (Just (4,23)-(5,56)) (VarPat (Just (4,23)-(4,24)) "n") (Ite (Just (5,4)-(5,56)) (Bop (Just (5,7)-(5,12)) Lt (Var (Just (5,7)-(5,8)) "n") (Lit (Just (5,11)-(5,12)) (LI 1))) (Var (Just (5,18)-(5,23)) "accum") (App (Just (5,29)-(5,56)) (Var (Just (5,29)-(5,35)) "helper") [ConApp (Just (5,36)-(5,48)) "::" (Just (Tuple (Just (5,37)-(5,47)) [Var (Just (5,37)-(5,38)) "x",Var (Just (5,42)-(5,47)) "accum"])) Nothing,Bop (Just (5,49)-(5,56)) Minus (Var (Just (5,50)-(5,51)) "n") (Lit (Just (5,54)-(5,55)) (LI 1))])) Nothing) Nothing)] (App (Just (6,2)-(6,16)) (Var (Just (6,2)-(6,8)) "helper") [Var (Just (6,9)-(6,14)) "accum",Var (Just (6,15)-(6,16)) "n"]))) Nothing) Nothing
Let (Just (9,2)-(12,75)) NonRec [(TuplePat (Just (9,7)-(9,10)) [VarPat (Just (9,7)-(9,8)) "a",VarPat (Just (9,9)-(9,10)) "b"],Tuple (Just (9,14)-(9,50)) [App (Just (9,15)-(9,31)) (Var (Just (9,16)-(9,27)) "List.length") [Var (Just (9,28)-(9,30)) "l1"],App (Just (9,33)-(9,49)) (Var (Just (9,34)-(9,45)) "List.length") [Var (Just (9,46)-(9,48)) "l2"]])] (Ite (Just (10,2)-(12,75)) (Bop (Just (10,5)-(10,10)) Lt (Var (Just (10,5)-(10,6)) "a") (Var (Just (10,9)-(10,10)) "b")) (Tuple (Just (11,7)-(11,47)) [App (Just (11,8)-(11,42)) (Var (Just (11,9)-(11,20)) "List.append") [App (Just (11,21)-(11,38)) (Var (Just (11,22)-(11,27)) "clone") [Lit (Just (11,28)-(11,29)) (LI 0),Bop (Just (11,30)-(11,37)) Minus (Var (Just (11,31)-(11,32)) "b") (Var (Just (11,35)-(11,36)) "a")],Var (Just (11,39)-(11,41)) "l1"],Var (Just (11,44)-(11,46)) "l2"]) (Ite (Just (12,7)-(12,75)) (Bop (Just (12,10)-(12,15)) Lt (Var (Just (12,10)-(12,11)) "b") (Var (Just (12,14)-(12,15)) "a")) (Tuple (Just (12,21)-(12,61)) [Var (Just (12,22)-(12,24)) "l1",App (Just (12,26)-(12,60)) (Var (Just (12,27)-(12,38)) "List.append") [App (Just (12,39)-(12,56)) (Var (Just (12,40)-(12,45)) "clone") [Lit (Just (12,46)-(12,47)) (LI 0),Bop (Just (12,48)-(12,55)) Minus (Var (Just (12,49)-(12,50)) "a") (Var (Just (12,53)-(12,54)) "b")],Var (Just (12,57)-(12,59)) "l2"]]) (Tuple (Just (12,67)-(12,75)) [Var (Just (12,68)-(12,70)) "l1",Var (Just (12,72)-(12,74)) "l2"])))
*)

(* typed spans
(2,14)-(6,16)
(9,2)-(12,75)
*)

(* correct types
int -> int -> int list
(int list * int list)
*)

(* bad types
'a list -> 'b list -> unit
unit
*)
