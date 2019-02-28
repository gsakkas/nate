
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     if x = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if x = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if x = 2
         then
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
         else
           if x = 3
           then
             buildTimes
               ((build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     match x with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(17,16)-(17,39)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(28,5)-(42,73)
match x with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Lam (Just (17,17)-(17,67)) (TuplePat (Just (17,17)-(17,34)) [VarPat (Just (17,17)-(17,18)) "a",VarPat (Just (17,19)-(17,20)) "b",VarPat (Just (17,21)-(17,27)) "a_less",VarPat (Just (17,28)-(17,34)) "b_less"]) (ConApp (Just (17,38)-(17,67)) "Thresh" (Just (Tuple (Just (17,45)-(17,67)) [Var (Just (17,46)-(17,47)) "a",Var (Just (17,49)-(17,50)) "b",Var (Just (17,52)-(17,58)) "a_less",Var (Just (17,60)-(17,66)) "b_less"])) Nothing) Nothing
Case (Just (30,5)-(42,70)) (Var (Just (30,11)-(30,12)) "x") [(LitPat (Just (31,7)-(31,8)) (LI 0),Nothing,App (Just (31,12)-(31,49)) (Var (Just (31,12)-(31,21)) "buildSine") [App (Just (31,22)-(31,49)) (Var (Just (31,23)-(31,28)) "build") [Tuple (Just (31,29)-(31,48)) [Var (Just (31,30)-(31,34)) "rand",Bop (Just (31,36)-(31,47)) Minus (Var (Just (31,37)-(31,42)) "depth") (Lit (Just (31,45)-(31,46)) (LI 1))]]]),(LitPat (Just (32,7)-(32,8)) (LI 1),Nothing,App (Just (32,12)-(32,51)) (Var (Just (32,12)-(32,23)) "buildCosine") [App (Just (32,24)-(32,51)) (Var (Just (32,25)-(32,30)) "build") [Tuple (Just (32,31)-(32,50)) [Var (Just (32,32)-(32,36)) "rand",Bop (Just (32,38)-(32,49)) Minus (Var (Just (32,39)-(32,44)) "depth") (Lit (Just (32,47)-(32,48)) (LI 1))]]]),(LitPat (Just (33,7)-(33,8)) (LI 2),Nothing,App (Just (34,9)-(35,69)) (Var (Just (34,9)-(34,21)) "buildAverage") [Tuple (Just (35,11)-(35,69)) [App (Just (35,12)-(35,39)) (Var (Just (35,13)-(35,18)) "build") [Tuple (Just (35,19)-(35,38)) [Var (Just (35,20)-(35,24)) "rand",Bop (Just (35,26)-(35,37)) Minus (Var (Just (35,27)-(35,32)) "depth") (Lit (Just (35,35)-(35,36)) (LI 1))]],App (Just (35,41)-(35,68)) (Var (Just (35,42)-(35,47)) "build") [Tuple (Just (35,48)-(35,67)) [Var (Just (35,49)-(35,53)) "rand",Bop (Just (35,55)-(35,66)) Minus (Var (Just (35,56)-(35,61)) "depth") (Lit (Just (35,64)-(35,65)) (LI 1))]]]]),(LitPat (Just (36,7)-(36,8)) (LI 3),Nothing,App (Just (37,9)-(38,69)) (Var (Just (37,9)-(37,19)) "buildTimes") [Tuple (Just (38,11)-(38,69)) [App (Just (38,12)-(38,39)) (Var (Just (38,13)-(38,18)) "build") [Tuple (Just (38,19)-(38,38)) [Var (Just (38,20)-(38,24)) "rand",Bop (Just (38,26)-(38,37)) Minus (Var (Just (38,27)-(38,32)) "depth") (Lit (Just (38,35)-(38,36)) (LI 1))]],App (Just (38,41)-(38,68)) (Var (Just (38,42)-(38,47)) "build") [Tuple (Just (38,48)-(38,67)) [Var (Just (38,49)-(38,53)) "rand",Bop (Just (38,55)-(38,66)) Minus (Var (Just (38,56)-(38,61)) "depth") (Lit (Just (38,64)-(38,65)) (LI 1))]]]]),(LitPat (Just (39,7)-(39,8)) (LI 4),Nothing,App (Just (40,9)-(42,70)) (Var (Just (40,9)-(40,20)) "buildThresh") [Tuple (Just (41,11)-(42,70)) [App (Just (41,12)-(41,39)) (Var (Just (41,13)-(41,18)) "build") [Tuple (Just (41,19)-(41,38)) [Var (Just (41,20)-(41,24)) "rand",Bop (Just (41,26)-(41,37)) Minus (Var (Just (41,27)-(41,32)) "depth") (Lit (Just (41,35)-(41,36)) (LI 1))]],App (Just (41,41)-(41,68)) (Var (Just (41,42)-(41,47)) "build") [Tuple (Just (41,48)-(41,67)) [Var (Just (41,49)-(41,53)) "rand",Bop (Just (41,55)-(41,66)) Minus (Var (Just (41,56)-(41,61)) "depth") (Lit (Just (41,64)-(41,65)) (LI 1))]],App (Just (42,13)-(42,40)) (Var (Just (42,14)-(42,19)) "build") [Tuple (Just (42,20)-(42,39)) [Var (Just (42,21)-(42,25)) "rand",Bop (Just (42,27)-(42,38)) Minus (Var (Just (42,28)-(42,33)) "depth") (Lit (Just (42,36)-(42,37)) (LI 1))]],App (Just (42,42)-(42,69)) (Var (Just (42,43)-(42,48)) "build") [Tuple (Just (42,49)-(42,68)) [Var (Just (42,50)-(42,54)) "rand",Bop (Just (42,56)-(42,67)) Minus (Var (Just (42,57)-(42,62)) "depth") (Lit (Just (42,65)-(42,66)) (LI 1))]]]])]
*)

(* typed spans
(17,17)-(17,67)
(30,5)-(42,70)
*)

(* correct types
(expr * expr * expr * expr) -> expr
expr
*)

(* bad types
(expr * expr) -> expr
unit
*)
