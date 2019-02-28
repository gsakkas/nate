
let rec mulByDigit i l =
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) / 10) != 0
        then ((hd * i) mod 10) :: (((hd * i) / 10) + (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;


(* fix

let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> [a + hd] in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) - 9) != 0
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;

*)

(* changed spans
(3,2)-(10,15)
let comb =
  fun a ->
    fun b ->
      match b with
      | [] -> [a]
      | hd :: tl -> [a + hd] in
let rec mBDhelper =
  fun i ->
    fun x ->
      match x with
      | [] -> []
      | hd :: tl -> if ((hd * i) - 9) <> 0
                    then ((hd * i) / 10) :: (comb ((hd * i) mod 10)
                                                  (mBDhelper i
                                                             tl))
                    else (hd * i) :: (mBDhelper i
                                                tl) in
mBDhelper i l
LetG NonRec (fromList [LamG EmptyG]) (LetG Rec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(11,15)) NonRec [(VarPat (Just (3,6)-(3,10)) "comb",Lam (Just (3,11)-(3,62)) (VarPat (Just (3,11)-(3,12)) "a") (Lam (Just (3,13)-(3,62)) (VarPat (Just (3,13)-(3,14)) "b") (Case (Just (3,17)-(3,62)) (Var (Just (3,23)-(3,24)) "b") [(ConPat (Just (3,32)-(3,34)) "[]" Nothing,Nothing,List (Just (3,38)-(3,41)) [Var (Just (3,39)-(3,40)) "a"] Nothing),(ConsPat (Just (3,44)-(3,50)) (VarPat (Just (3,44)-(3,46)) "hd") (VarPat (Just (3,48)-(3,50)) "tl"),Nothing,List (Just (3,54)-(3,62)) [Bop (Just (3,55)-(3,61)) Plus (Var (Just (3,55)-(3,56)) "a") (Var (Just (3,59)-(3,61)) "hd")] Nothing)]) Nothing) Nothing)] (Let (Just (4,2)-(11,15)) Rec [(VarPat (Just (4,10)-(4,19)) "mBDhelper",Lam (Just (4,20)-(10,41)) (VarPat (Just (4,20)-(4,21)) "i") (Lam (Just (4,22)-(10,41)) (VarPat (Just (4,22)-(4,23)) "x") (Case (Just (5,4)-(10,41)) (Var (Just (5,10)-(5,11)) "x") [(ConPat (Just (6,6)-(6,8)) "[]" Nothing,Nothing,List (Just (6,12)-(6,14)) [] Nothing),(ConsPat (Just (7,6)-(7,12)) (VarPat (Just (7,6)-(7,8)) "hd") (VarPat (Just (7,10)-(7,12)) "tl"),Nothing,Ite (Just (8,8)-(10,41)) (Bop (Just (8,11)-(8,30)) Neq (Bop (Just (8,11)-(8,25)) Minus (Bop (Just (8,12)-(8,20)) Times (Var (Just (8,13)-(8,15)) "hd") (Var (Just (8,18)-(8,19)) "i")) (Lit (Just (8,23)-(8,24)) (LI 9))) (Lit (Just (8,29)-(8,30)) (LI 0))) (ConApp (Just (9,13)-(9,73)) "::" (Just (Tuple (Just (9,13)-(9,73)) [Bop (Just (9,13)-(9,28)) Div (Bop (Just (9,14)-(9,22)) Times (Var (Just (9,15)-(9,17)) "hd") (Var (Just (9,20)-(9,21)) "i")) (Lit (Just (9,25)-(9,27)) (LI 10)),App (Just (9,32)-(9,73)) (Var (Just (9,33)-(9,37)) "comb") [Bop (Just (9,38)-(9,55)) Mod (Bop (Just (9,39)-(9,47)) Times (Var (Just (9,40)-(9,42)) "hd") (Var (Just (9,45)-(9,46)) "i")) (Lit (Just (9,52)-(9,54)) (LI 10)),App (Just (9,56)-(9,72)) (Var (Just (9,57)-(9,66)) "mBDhelper") [Var (Just (9,67)-(9,68)) "i",Var (Just (9,69)-(9,71)) "tl"]]])) Nothing) (ConApp (Just (10,13)-(10,41)) "::" (Just (Tuple (Just (10,13)-(10,41)) [Bop (Just (10,13)-(10,21)) Times (Var (Just (10,14)-(10,16)) "hd") (Var (Just (10,19)-(10,20)) "i"),App (Just (10,25)-(10,41)) (Var (Just (10,26)-(10,35)) "mBDhelper") [Var (Just (10,36)-(10,37)) "i",Var (Just (10,38)-(10,40)) "tl"]])) Nothing))]) Nothing) Nothing)] (App (Just (11,2)-(11,15)) (Var (Just (11,2)-(11,11)) "mBDhelper") [Var (Just (11,12)-(11,13)) "i",Var (Just (11,14)-(11,15)) "l"]))
*)

(* typed spans
(3,2)-(11,15)
*)

(* correct types
int list
*)

(* bad types
int
*)
