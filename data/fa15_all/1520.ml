
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

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (1, 7) with
    | 1 -> VarX
    | 2 -> VarY
    | 3 -> buildSine (build (rand, (depth - 1)))
    | 4 -> buildCosine (build (rand, (depth - 1)))
    | 5 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))));;


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
  if depth > 0
  then
    match rand (1, 5) with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 4 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  else (match rand (1, 2) with | 1 -> buildX () | 2 -> buildY ());;

*)

(* changed spans
(21,15)-(37,40)
fun () -> VarX
LamG (ConAppG Nothing)

(21,15)-(37,40)
fun () -> VarY
LamG (ConAppG Nothing)

(24,4)-(37,40)
match rand (1 , 5) with
| 1 -> buildSine (build (rand , depth - 1))
| 2 -> buildCosine (build (rand , depth - 1))
| 3 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(22,2)-(37,40)
match rand (1 , 2) with
| 1 -> buildX ()
| 2 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Lam (Just (21,11)-(21,20)) (ConPat (Just (21,11)-(21,13)) "()" Nothing) (ConApp (Just (21,16)-(21,20)) "VarX" Nothing Nothing) Nothing
Lam (Just (23,11)-(23,20)) (ConPat (Just (23,11)-(23,13)) "()" Nothing) (ConApp (Just (23,16)-(23,20)) "VarY" Nothing Nothing) Nothing
Case (Just (28,4)-(39,69)) (App (Just (28,10)-(28,21)) (Var (Just (28,10)-(28,14)) "rand") [Tuple (Just (28,15)-(28,21)) [Lit (Just (28,16)-(28,17)) (LI 1),Lit (Just (28,19)-(28,20)) (LI 5)]]) [(LitPat (Just (29,6)-(29,7)) (LI 1),Nothing,App (Just (29,11)-(29,48)) (Var (Just (29,11)-(29,20)) "buildSine") [App (Just (29,21)-(29,48)) (Var (Just (29,22)-(29,27)) "build") [Tuple (Just (29,28)-(29,47)) [Var (Just (29,29)-(29,33)) "rand",Bop (Just (29,35)-(29,46)) Minus (Var (Just (29,36)-(29,41)) "depth") (Lit (Just (29,44)-(29,45)) (LI 1))]]]),(LitPat (Just (30,6)-(30,7)) (LI 2),Nothing,App (Just (30,11)-(30,50)) (Var (Just (30,11)-(30,22)) "buildCosine") [App (Just (30,23)-(30,50)) (Var (Just (30,24)-(30,29)) "build") [Tuple (Just (30,30)-(30,49)) [Var (Just (30,31)-(30,35)) "rand",Bop (Just (30,37)-(30,48)) Minus (Var (Just (30,38)-(30,43)) "depth") (Lit (Just (30,46)-(30,47)) (LI 1))]]]),(LitPat (Just (31,6)-(31,7)) (LI 3),Nothing,App (Just (32,8)-(33,68)) (Var (Just (32,8)-(32,20)) "buildAverage") [Tuple (Just (33,10)-(33,68)) [App (Just (33,11)-(33,38)) (Var (Just (33,12)-(33,17)) "build") [Tuple (Just (33,18)-(33,37)) [Var (Just (33,19)-(33,23)) "rand",Bop (Just (33,25)-(33,36)) Minus (Var (Just (33,26)-(33,31)) "depth") (Lit (Just (33,34)-(33,35)) (LI 1))]],App (Just (33,40)-(33,67)) (Var (Just (33,41)-(33,46)) "build") [Tuple (Just (33,47)-(33,66)) [Var (Just (33,48)-(33,52)) "rand",Bop (Just (33,54)-(33,65)) Minus (Var (Just (33,55)-(33,60)) "depth") (Lit (Just (33,63)-(33,64)) (LI 1))]]]]),(LitPat (Just (34,6)-(34,7)) (LI 4),Nothing,App (Just (35,8)-(35,77)) (Var (Just (35,8)-(35,18)) "buildTimes") [Tuple (Just (35,19)-(35,77)) [App (Just (35,20)-(35,47)) (Var (Just (35,21)-(35,26)) "build") [Tuple (Just (35,27)-(35,46)) [Var (Just (35,28)-(35,32)) "rand",Bop (Just (35,34)-(35,45)) Minus (Var (Just (35,35)-(35,40)) "depth") (Lit (Just (35,43)-(35,44)) (LI 1))]],App (Just (35,49)-(35,76)) (Var (Just (35,50)-(35,55)) "build") [Tuple (Just (35,56)-(35,75)) [Var (Just (35,57)-(35,61)) "rand",Bop (Just (35,63)-(35,74)) Minus (Var (Just (35,64)-(35,69)) "depth") (Lit (Just (35,72)-(35,73)) (LI 1))]]]]),(LitPat (Just (36,6)-(36,7)) (LI 5),Nothing,App (Just (37,8)-(39,69)) (Var (Just (37,8)-(37,19)) "buildThresh") [Tuple (Just (38,10)-(39,69)) [App (Just (38,11)-(38,38)) (Var (Just (38,12)-(38,17)) "build") [Tuple (Just (38,18)-(38,37)) [Var (Just (38,19)-(38,23)) "rand",Bop (Just (38,25)-(38,36)) Minus (Var (Just (38,26)-(38,31)) "depth") (Lit (Just (38,34)-(38,35)) (LI 1))]],App (Just (38,40)-(38,67)) (Var (Just (38,41)-(38,46)) "build") [Tuple (Just (38,47)-(38,66)) [Var (Just (38,48)-(38,52)) "rand",Bop (Just (38,54)-(38,65)) Minus (Var (Just (38,55)-(38,60)) "depth") (Lit (Just (38,63)-(38,64)) (LI 1))]],App (Just (39,12)-(39,39)) (Var (Just (39,13)-(39,18)) "build") [Tuple (Just (39,19)-(39,38)) [Var (Just (39,20)-(39,24)) "rand",Bop (Just (39,26)-(39,37)) Minus (Var (Just (39,27)-(39,32)) "depth") (Lit (Just (39,35)-(39,36)) (LI 1))]],App (Just (39,41)-(39,68)) (Var (Just (39,42)-(39,47)) "build") [Tuple (Just (39,48)-(39,67)) [Var (Just (39,49)-(39,53)) "rand",Bop (Just (39,55)-(39,66)) Minus (Var (Just (39,56)-(39,61)) "depth") (Lit (Just (39,64)-(39,65)) (LI 1))]]]])]
Case (Just (40,7)-(40,65)) (App (Just (40,14)-(40,25)) (Var (Just (40,14)-(40,18)) "rand") [Tuple (Just (40,19)-(40,25)) [Lit (Just (40,20)-(40,21)) (LI 1),Lit (Just (40,23)-(40,24)) (LI 2)]]) [(LitPat (Just (40,33)-(40,34)) (LI 1),Nothing,App (Just (40,38)-(40,47)) (Var (Just (40,38)-(40,44)) "buildX") [ConApp (Just (40,45)-(40,47)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (40,50)-(40,51)) (LI 2),Nothing,App (Just (40,55)-(40,64)) (Var (Just (40,55)-(40,61)) "buildY") [ConApp (Just (40,62)-(40,64)) "()" Nothing (Just (TApp "unit" []))])]
*)

(* typed spans
(21,11)-(21,20)
(23,11)-(23,20)
(28,4)-(39,69)
(40,7)-(40,65)
*)

(* correct types
unit -> expr
unit -> expr
expr
expr
*)

(* bad types
((int * int) -> int * int) -> unit
((int * int) -> int * int) -> unit
expr
unit
*)
