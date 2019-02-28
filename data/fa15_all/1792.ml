
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildY () | _ -> buildX ()
  else
    (let r = rand (0, 6) in
     match r with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
     | 3 -> buildTimes ((build (rand, (depth - 1))), (buildX ()))
     | 4 ->
         ((buildThresh
             ((build (rand, (depth - 1))), (buildX ()), (buildY ()))),
           (buildX ())));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSinCos e = SinCos e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let r = rand (0, 2) in match r with | 0 -> buildY () | _ -> buildX ()
  else
    (let r = rand (0, 6) in
     match r with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
     | 3 -> buildTimes ((build (rand, (depth - 1))), (buildX ()))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (buildX ()), (buildY ()),
             (buildX ()))
     | 5 -> buildSinCos (build (rand, (depth - 1))));;

*)

(* changed spans
(16,18)-(16,24)
SinCos e
ConAppG (Just VarG)

(16,18)-(16,24)
fun e -> Sine e
LamG (ConAppG (Just VarG))

(31,5)-(39,23)
match r with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , buildY ())
| 3 -> buildTimes (build (rand , depth - 1) , buildX ())
| 4 -> buildThresh (build (rand , depth - 1) , buildX () , buildY () , buildX ())
| 5 -> buildSinCos (build (rand , depth - 1))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
ConApp (Just (16,20)-(16,28)) "SinCos" (Just (Var (Just (16,27)-(16,28)) "e")) Nothing
Lam (Just (18,14)-(18,24)) (VarPat (Just (18,14)-(18,15)) "e") (ConApp (Just (18,18)-(18,24)) "Sine" (Just (Var (Just (18,23)-(18,24)) "e")) Nothing) Nothing
Case (Just (33,5)-(42,51)) (Var (Just (33,11)-(33,12)) "r") [(LitPat (Just (34,7)-(34,8)) (LI 0),Nothing,App (Just (34,12)-(34,49)) (Var (Just (34,12)-(34,21)) "buildSine") [App (Just (34,22)-(34,49)) (Var (Just (34,23)-(34,28)) "build") [Tuple (Just (34,29)-(34,48)) [Var (Just (34,30)-(34,34)) "rand",Bop (Just (34,36)-(34,47)) Minus (Var (Just (34,37)-(34,42)) "depth") (Lit (Just (34,45)-(34,46)) (LI 1))]]]),(LitPat (Just (35,7)-(35,8)) (LI 1),Nothing,App (Just (35,12)-(35,51)) (Var (Just (35,12)-(35,23)) "buildCosine") [App (Just (35,24)-(35,51)) (Var (Just (35,25)-(35,30)) "build") [Tuple (Just (35,31)-(35,50)) [Var (Just (35,32)-(35,36)) "rand",Bop (Just (35,38)-(35,49)) Minus (Var (Just (35,39)-(35,44)) "depth") (Lit (Just (35,47)-(35,48)) (LI 1))]]]),(LitPat (Just (36,7)-(36,8)) (LI 2),Nothing,App (Just (36,12)-(36,67)) (Var (Just (36,12)-(36,24)) "buildAverage") [Tuple (Just (36,25)-(36,67)) [App (Just (36,26)-(36,53)) (Var (Just (36,27)-(36,32)) "build") [Tuple (Just (36,33)-(36,52)) [Var (Just (36,34)-(36,38)) "rand",Bop (Just (36,40)-(36,51)) Minus (Var (Just (36,41)-(36,46)) "depth") (Lit (Just (36,49)-(36,50)) (LI 1))]],App (Just (36,55)-(36,66)) (Var (Just (36,56)-(36,62)) "buildY") [ConApp (Just (36,63)-(36,65)) "()" Nothing (Just (TApp "unit" []))]]]),(LitPat (Just (37,7)-(37,8)) (LI 3),Nothing,App (Just (37,12)-(37,65)) (Var (Just (37,12)-(37,22)) "buildTimes") [Tuple (Just (37,23)-(37,65)) [App (Just (37,24)-(37,51)) (Var (Just (37,25)-(37,30)) "build") [Tuple (Just (37,31)-(37,50)) [Var (Just (37,32)-(37,36)) "rand",Bop (Just (37,38)-(37,49)) Minus (Var (Just (37,39)-(37,44)) "depth") (Lit (Just (37,47)-(37,48)) (LI 1))]],App (Just (37,53)-(37,64)) (Var (Just (37,54)-(37,60)) "buildX") [ConApp (Just (37,61)-(37,63)) "()" Nothing (Just (TApp "unit" []))]]]),(LitPat (Just (38,7)-(38,8)) (LI 4),Nothing,App (Just (39,9)-(41,25)) (Var (Just (39,9)-(39,20)) "buildThresh") [Tuple (Just (40,11)-(41,25)) [App (Just (40,12)-(40,39)) (Var (Just (40,13)-(40,18)) "build") [Tuple (Just (40,19)-(40,38)) [Var (Just (40,20)-(40,24)) "rand",Bop (Just (40,26)-(40,37)) Minus (Var (Just (40,27)-(40,32)) "depth") (Lit (Just (40,35)-(40,36)) (LI 1))]],App (Just (40,41)-(40,52)) (Var (Just (40,42)-(40,48)) "buildX") [ConApp (Just (40,49)-(40,51)) "()" Nothing (Just (TApp "unit" []))],App (Just (40,54)-(40,65)) (Var (Just (40,55)-(40,61)) "buildY") [ConApp (Just (40,62)-(40,64)) "()" Nothing (Just (TApp "unit" []))],App (Just (41,13)-(41,24)) (Var (Just (41,14)-(41,20)) "buildX") [ConApp (Just (41,21)-(41,23)) "()" Nothing (Just (TApp "unit" []))]]]),(LitPat (Just (42,7)-(42,8)) (LI 5),Nothing,App (Just (42,12)-(42,51)) (Var (Just (42,12)-(42,23)) "buildSinCos") [App (Just (42,24)-(42,51)) (Var (Just (42,25)-(42,30)) "build") [Tuple (Just (42,31)-(42,50)) [Var (Just (42,32)-(42,36)) "rand",Bop (Just (42,38)-(42,49)) Minus (Var (Just (42,39)-(42,44)) "depth") (Lit (Just (42,47)-(42,48)) (LI 1))]]])]
*)

(* typed spans
(16,20)-(16,28)
(18,14)-(18,24)
(33,5)-(42,51)
*)

(* correct types
expr
expr -> expr
expr
*)

(* bad types
expr
expr
expr
*)
