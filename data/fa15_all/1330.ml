
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then match rand (0, 0) with | 0 -> buildX | 1 -> buildY
  else
    (match rand (2, 7) with
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ()
  else
    (match rand (0, 7) with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(27,22)-(27,23)
1
LitG

(27,37)-(27,43)
buildX ()
AppG (fromList [ConAppG Nothing])

(27,51)-(27,57)
()
ConAppG Nothing

(27,51)-(27,57)
buildY ()
AppG (fromList [ConAppG Nothing])

(29,4)-(41,71)
()
ConAppG Nothing

(29,11)-(29,22)
match rand (0 , 7) with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(29,17)-(29,18)
0
LitG

(30,12)-(30,21)
buildX
VarG

(30,12)-(30,21)
()
ConAppG Nothing

(30,12)-(30,21)
buildY ()
AppG (fromList [ConAppG Nothing])

(30,12)-(30,21)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lit (Just (27,22)-(27,23)) (LI 1)
App (Just (27,37)-(27,46)) (Var (Just (27,37)-(27,43)) "buildX") [ConApp (Just (27,44)-(27,46)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (27,44)-(27,46)) "()" Nothing (Just (TApp "unit" []))
App (Just (27,54)-(27,63)) (Var (Just (27,54)-(27,60)) "buildY") [ConApp (Just (27,61)-(27,63)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (27,61)-(27,63)) "()" Nothing (Just (TApp "unit" []))
Case (Just (29,4)-(43,71)) (App (Just (29,11)-(29,22)) (Var (Just (29,11)-(29,15)) "rand") [Tuple (Just (29,16)-(29,22)) [Lit (Just (29,17)-(29,18)) (LI 0),Lit (Just (29,20)-(29,21)) (LI 7)]]) [(LitPat (Just (30,7)-(30,8)) (LI 0),Nothing,App (Just (30,12)-(30,21)) (Var (Just (30,12)-(30,18)) "buildX") [ConApp (Just (30,19)-(30,21)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (31,7)-(31,8)) (LI 1),Nothing,App (Just (31,12)-(31,21)) (Var (Just (31,12)-(31,18)) "buildY") [ConApp (Just (31,19)-(31,21)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (32,7)-(32,8)) (LI 2),Nothing,App (Just (32,12)-(32,49)) (Var (Just (32,12)-(32,21)) "buildSine") [App (Just (32,22)-(32,49)) (Var (Just (32,23)-(32,28)) "build") [Tuple (Just (32,29)-(32,48)) [Var (Just (32,30)-(32,34)) "rand",Bop (Just (32,36)-(32,47)) Minus (Var (Just (32,37)-(32,42)) "depth") (Lit (Just (32,45)-(32,46)) (LI 1))]]]),(LitPat (Just (33,7)-(33,8)) (LI 3),Nothing,App (Just (33,12)-(33,51)) (Var (Just (33,12)-(33,23)) "buildCosine") [App (Just (33,24)-(33,51)) (Var (Just (33,25)-(33,30)) "build") [Tuple (Just (33,31)-(33,50)) [Var (Just (33,32)-(33,36)) "rand",Bop (Just (33,38)-(33,49)) Minus (Var (Just (33,39)-(33,44)) "depth") (Lit (Just (33,47)-(33,48)) (LI 1))]]]),(LitPat (Just (34,7)-(34,8)) (LI 4),Nothing,App (Just (35,9)-(36,69)) (Var (Just (35,9)-(35,21)) "buildAverage") [Tuple (Just (36,11)-(36,69)) [App (Just (36,12)-(36,39)) (Var (Just (36,13)-(36,18)) "build") [Tuple (Just (36,19)-(36,38)) [Var (Just (36,20)-(36,24)) "rand",Bop (Just (36,26)-(36,37)) Minus (Var (Just (36,27)-(36,32)) "depth") (Lit (Just (36,35)-(36,36)) (LI 1))]],App (Just (36,41)-(36,68)) (Var (Just (36,42)-(36,47)) "build") [Tuple (Just (36,48)-(36,67)) [Var (Just (36,49)-(36,53)) "rand",Bop (Just (36,55)-(36,66)) Minus (Var (Just (36,56)-(36,61)) "depth") (Lit (Just (36,64)-(36,65)) (LI 1))]]]]),(LitPat (Just (37,7)-(37,8)) (LI 5),Nothing,App (Just (38,9)-(39,69)) (Var (Just (38,9)-(38,19)) "buildTimes") [Tuple (Just (39,11)-(39,69)) [App (Just (39,12)-(39,39)) (Var (Just (39,13)-(39,18)) "build") [Tuple (Just (39,19)-(39,38)) [Var (Just (39,20)-(39,24)) "rand",Bop (Just (39,26)-(39,37)) Minus (Var (Just (39,27)-(39,32)) "depth") (Lit (Just (39,35)-(39,36)) (LI 1))]],App (Just (39,41)-(39,68)) (Var (Just (39,42)-(39,47)) "build") [Tuple (Just (39,48)-(39,67)) [Var (Just (39,49)-(39,53)) "rand",Bop (Just (39,55)-(39,66)) Minus (Var (Just (39,56)-(39,61)) "depth") (Lit (Just (39,64)-(39,65)) (LI 1))]]]]),(LitPat (Just (40,7)-(40,8)) (LI 6),Nothing,App (Just (41,9)-(43,70)) (Var (Just (41,9)-(41,20)) "buildThresh") [Tuple (Just (42,11)-(43,70)) [App (Just (42,12)-(42,39)) (Var (Just (42,13)-(42,18)) "build") [Tuple (Just (42,19)-(42,38)) [Var (Just (42,20)-(42,24)) "rand",Bop (Just (42,26)-(42,37)) Minus (Var (Just (42,27)-(42,32)) "depth") (Lit (Just (42,35)-(42,36)) (LI 1))]],App (Just (42,41)-(42,68)) (Var (Just (42,42)-(42,47)) "build") [Tuple (Just (42,48)-(42,67)) [Var (Just (42,49)-(42,53)) "rand",Bop (Just (42,55)-(42,66)) Minus (Var (Just (42,56)-(42,61)) "depth") (Lit (Just (42,64)-(42,65)) (LI 1))]],App (Just (43,13)-(43,40)) (Var (Just (43,14)-(43,19)) "build") [Tuple (Just (43,20)-(43,39)) [Var (Just (43,21)-(43,25)) "rand",Bop (Just (43,27)-(43,38)) Minus (Var (Just (43,28)-(43,33)) "depth") (Lit (Just (43,36)-(43,37)) (LI 1))]],App (Just (43,42)-(43,69)) (Var (Just (43,43)-(43,48)) "build") [Tuple (Just (43,49)-(43,68)) [Var (Just (43,50)-(43,54)) "rand",Bop (Just (43,56)-(43,67)) Minus (Var (Just (43,57)-(43,62)) "depth") (Lit (Just (43,65)-(43,66)) (LI 1))]]]])]
Lit (Just (29,17)-(29,18)) (LI 0)
Var (Just (30,12)-(30,18)) "buildX"
ConApp (Just (30,19)-(30,21)) "()" Nothing (Just (TApp "unit" []))
App (Just (31,12)-(31,21)) (Var (Just (31,12)-(31,18)) "buildY") [ConApp (Just (31,19)-(31,21)) "()" Nothing (Just (TApp "unit" []))]
App (Just (32,12)-(32,49)) (Var (Just (32,12)-(32,21)) "buildSine") [App (Just (32,22)-(32,49)) (Var (Just (32,23)-(32,28)) "build") [Tuple (Just (32,29)-(32,48)) [Var (Just (32,30)-(32,34)) "rand",Bop (Just (32,36)-(32,47)) Minus (Var (Just (32,37)-(32,42)) "depth") (Lit (Just (32,45)-(32,46)) (LI 1))]]]
*)

(* typed spans
(27,22)-(27,23)
(27,37)-(27,46)
(27,44)-(27,46)
(27,54)-(27,63)
(27,61)-(27,63)
(29,4)-(43,71)
(29,17)-(29,18)
(30,12)-(30,18)
(30,19)-(30,21)
(31,12)-(31,21)
(32,12)-(32,49)
*)

(* correct types
int
expr
unit
expr
unit
expr
int
unit -> expr
unit
expr
expr
*)

(* bad types
int
unit -> expr
unit -> expr
unit -> expr
expr
int
int
expr -> expr
expr -> expr
expr -> expr
expr -> expr
*)
