
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
  then (if (rand mod 2) = 0 then buildX () else buildY ())
  else
    if (rand mod 5) = 0
    then buildSine (build (rand, (depth - 1)))
    else
      if (rand mod 5) = 1
      then buildCosine (build (rand, (depth - 1)))
      else
        if (rand mod 5) = 2
        then
          buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
        else
          if (rand mod 5) = 3
          then
            buildTimes
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if (rand mod 5) = 4
            then
              buildThresh
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                  (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
  if depth <= 0
  then buildX ()
  else
    (match rand (0, 4) with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 4))), (build (rand, (depth - 4))),
             (build (rand, (depth - 4))), (build (rand, (depth - 4))))
     | _ -> buildY ());;

*)

(* changed spans
(26,5)-(26,14)
depth <= 0
BopG VarG LitG

(27,7)-(27,58)
buildX ()
AppG (fromList [ConAppG Nothing])

(27,7)-(27,58)
buildX
VarG

(27,7)-(27,58)
()
ConAppG Nothing

(27,7)-(27,58)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 2) , build (rand , depth - 2))
| 3 -> buildTimes (build (rand , depth - 2) , build (rand , depth - 2))
| 4 -> buildThresh (build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4))
| _ -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(29,4)-(49,75)
rand
VarG

(29,4)-(49,75)
(0 , 4)
TupleG (fromList [LitG])

(38,42)-(38,69)
2
LitG

(40,10)-(49,75)
2
LitG

(43,44)-(43,71)
2
LitG

(45,12)-(49,75)
2
LitG

(48,46)-(48,73)
4
LitG

(48,69)-(48,70)
4
LitG

(49,41)-(49,42)
4
LitG

(49,70)-(49,71)
4
LitG

(45,12)-(49,75)
buildY ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
Bop (Just (26,5)-(26,15)) Le (Var (Just (26,5)-(26,10)) "depth") (Lit (Just (26,14)-(26,15)) (LI 0))
App (Just (27,7)-(27,16)) (Var (Just (27,7)-(27,13)) "buildX") [ConApp (Just (27,14)-(27,16)) "()" Nothing (Just (TApp "unit" []))]
Var (Just (27,7)-(27,13)) "buildX"
ConApp (Just (27,14)-(27,16)) "()" Nothing (Just (TApp "unit" []))
Case (Just (29,4)-(42,22)) (App (Just (29,11)-(29,22)) (Var (Just (29,11)-(29,15)) "rand") [Tuple (Just (29,16)-(29,22)) [Lit (Just (29,17)-(29,18)) (LI 0),Lit (Just (29,20)-(29,21)) (LI 4)]]) [(LitPat (Just (30,7)-(30,8)) (LI 0),Nothing,App (Just (30,12)-(30,49)) (Var (Just (30,12)-(30,21)) "buildSine") [App (Just (30,22)-(30,49)) (Var (Just (30,23)-(30,28)) "build") [Tuple (Just (30,29)-(30,48)) [Var (Just (30,30)-(30,34)) "rand",Bop (Just (30,36)-(30,47)) Minus (Var (Just (30,37)-(30,42)) "depth") (Lit (Just (30,45)-(30,46)) (LI 1))]]]),(LitPat (Just (31,7)-(31,8)) (LI 1),Nothing,App (Just (31,12)-(31,51)) (Var (Just (31,12)-(31,23)) "buildCosine") [App (Just (31,24)-(31,51)) (Var (Just (31,25)-(31,30)) "build") [Tuple (Just (31,31)-(31,50)) [Var (Just (31,32)-(31,36)) "rand",Bop (Just (31,38)-(31,49)) Minus (Var (Just (31,39)-(31,44)) "depth") (Lit (Just (31,47)-(31,48)) (LI 1))]]]),(LitPat (Just (32,7)-(32,8)) (LI 2),Nothing,App (Just (33,9)-(34,69)) (Var (Just (33,9)-(33,21)) "buildAverage") [Tuple (Just (34,11)-(34,69)) [App (Just (34,12)-(34,39)) (Var (Just (34,13)-(34,18)) "build") [Tuple (Just (34,19)-(34,38)) [Var (Just (34,20)-(34,24)) "rand",Bop (Just (34,26)-(34,37)) Minus (Var (Just (34,27)-(34,32)) "depth") (Lit (Just (34,35)-(34,36)) (LI 2))]],App (Just (34,41)-(34,68)) (Var (Just (34,42)-(34,47)) "build") [Tuple (Just (34,48)-(34,67)) [Var (Just (34,49)-(34,53)) "rand",Bop (Just (34,55)-(34,66)) Minus (Var (Just (34,56)-(34,61)) "depth") (Lit (Just (34,64)-(34,65)) (LI 2))]]]]),(LitPat (Just (35,7)-(35,8)) (LI 3),Nothing,App (Just (36,9)-(37,69)) (Var (Just (36,9)-(36,19)) "buildTimes") [Tuple (Just (37,11)-(37,69)) [App (Just (37,12)-(37,39)) (Var (Just (37,13)-(37,18)) "build") [Tuple (Just (37,19)-(37,38)) [Var (Just (37,20)-(37,24)) "rand",Bop (Just (37,26)-(37,37)) Minus (Var (Just (37,27)-(37,32)) "depth") (Lit (Just (37,35)-(37,36)) (LI 2))]],App (Just (37,41)-(37,68)) (Var (Just (37,42)-(37,47)) "build") [Tuple (Just (37,48)-(37,67)) [Var (Just (37,49)-(37,53)) "rand",Bop (Just (37,55)-(37,66)) Minus (Var (Just (37,56)-(37,61)) "depth") (Lit (Just (37,64)-(37,65)) (LI 2))]]]]),(LitPat (Just (38,7)-(38,8)) (LI 4),Nothing,App (Just (39,9)-(41,70)) (Var (Just (39,9)-(39,20)) "buildThresh") [Tuple (Just (40,11)-(41,70)) [App (Just (40,12)-(40,39)) (Var (Just (40,13)-(40,18)) "build") [Tuple (Just (40,19)-(40,38)) [Var (Just (40,20)-(40,24)) "rand",Bop (Just (40,26)-(40,37)) Minus (Var (Just (40,27)-(40,32)) "depth") (Lit (Just (40,35)-(40,36)) (LI 4))]],App (Just (40,41)-(40,68)) (Var (Just (40,42)-(40,47)) "build") [Tuple (Just (40,48)-(40,67)) [Var (Just (40,49)-(40,53)) "rand",Bop (Just (40,55)-(40,66)) Minus (Var (Just (40,56)-(40,61)) "depth") (Lit (Just (40,64)-(40,65)) (LI 4))]],App (Just (41,13)-(41,40)) (Var (Just (41,14)-(41,19)) "build") [Tuple (Just (41,20)-(41,39)) [Var (Just (41,21)-(41,25)) "rand",Bop (Just (41,27)-(41,38)) Minus (Var (Just (41,28)-(41,33)) "depth") (Lit (Just (41,36)-(41,37)) (LI 4))]],App (Just (41,42)-(41,69)) (Var (Just (41,43)-(41,48)) "build") [Tuple (Just (41,49)-(41,68)) [Var (Just (41,50)-(41,54)) "rand",Bop (Just (41,56)-(41,67)) Minus (Var (Just (41,57)-(41,62)) "depth") (Lit (Just (41,65)-(41,66)) (LI 4))]]]]),(WildPat (Just (42,7)-(42,8)),Nothing,App (Just (42,12)-(42,21)) (Var (Just (42,12)-(42,18)) "buildY") [ConApp (Just (42,19)-(42,21)) "()" Nothing (Just (TApp "unit" []))])]
Var (Just (29,11)-(29,15)) "rand"
Tuple (Just (29,16)-(29,22)) [Lit (Just (29,17)-(29,18)) (LI 0),Lit (Just (29,20)-(29,21)) (LI 4)]
Lit (Just (34,35)-(34,36)) (LI 2)
Lit (Just (34,64)-(34,65)) (LI 2)
Lit (Just (37,35)-(37,36)) (LI 2)
Lit (Just (37,64)-(37,65)) (LI 2)
Lit (Just (40,35)-(40,36)) (LI 4)
Lit (Just (40,64)-(40,65)) (LI 4)
Lit (Just (41,36)-(41,37)) (LI 4)
Lit (Just (41,65)-(41,66)) (LI 4)
App (Just (42,12)-(42,21)) (Var (Just (42,12)-(42,18)) "buildY") [ConApp (Just (42,19)-(42,21)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(26,5)-(26,15)
(27,7)-(27,16)
(27,7)-(27,13)
(27,14)-(27,16)
(29,4)-(42,22)
(29,11)-(29,15)
(29,16)-(29,22)
(34,35)-(34,36)
(34,64)-(34,65)
(37,35)-(37,36)
(37,64)-(37,65)
(40,35)-(40,36)
(40,64)-(40,65)
(41,36)-(41,37)
(41,65)-(41,66)
(42,12)-(42,21)
*)

(* correct types
bool
expr
unit -> expr
unit
expr
(int * int) -> int
(int * int)
int
int
int
int
int
int
int
int
expr
*)

(* bad types
bool
expr
expr
expr
expr
unit
unit
expr
unit
expr
unit
expr
int
int
int
unit
*)
