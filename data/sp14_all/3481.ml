
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
  match depth with
  | 0 -> (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ())
  | _ ->
      (match rand (0, 4) with
       | 0 -> buildSine (build (rand, (depth - 1)))
       | 1 -> buildCosine (build (rand, (depth - 1)))
       | 2 -> buildAverage (build (rand, (depth - 1)))
       | 3 -> buildTimes (build (rand, (depth - 1)))
       | 4 -> buildThresh (build (rand, (depth - 1))));;


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
  match depth with
  | 0 -> (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ())
  | _ ->
      (match rand (0, 4) with
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
(32,27)-(32,54)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(33,14)-(33,24)
buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(33,25)-(33,52)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(34,14)-(34,25)
build
VarG

(34,14)-(34,25)
(rand , depth - 1)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(34,14)-(34,25)
buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(34,26)-(34,53)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (34,13)-(34,71)) [App (Just (34,14)-(34,41)) (Var (Just (34,15)-(34,20)) "build") [Tuple (Just (34,21)-(34,40)) [Var (Just (34,22)-(34,26)) "rand",Bop (Just (34,28)-(34,39)) Minus (Var (Just (34,29)-(34,34)) "depth") (Lit (Just (34,37)-(34,38)) (LI 1))]],App (Just (34,43)-(34,70)) (Var (Just (34,44)-(34,49)) "build") [Tuple (Just (34,50)-(34,69)) [Var (Just (34,51)-(34,55)) "rand",Bop (Just (34,57)-(34,68)) Minus (Var (Just (34,58)-(34,63)) "depth") (Lit (Just (34,66)-(34,67)) (LI 1))]]]
App (Just (36,11)-(37,71)) (Var (Just (36,11)-(36,21)) "buildTimes") [Tuple (Just (37,13)-(37,71)) [App (Just (37,14)-(37,41)) (Var (Just (37,15)-(37,20)) "build") [Tuple (Just (37,21)-(37,40)) [Var (Just (37,22)-(37,26)) "rand",Bop (Just (37,28)-(37,39)) Minus (Var (Just (37,29)-(37,34)) "depth") (Lit (Just (37,37)-(37,38)) (LI 1))]],App (Just (37,43)-(37,70)) (Var (Just (37,44)-(37,49)) "build") [Tuple (Just (37,50)-(37,69)) [Var (Just (37,51)-(37,55)) "rand",Bop (Just (37,57)-(37,68)) Minus (Var (Just (37,58)-(37,63)) "depth") (Lit (Just (37,66)-(37,67)) (LI 1))]]]]
Tuple (Just (37,13)-(37,71)) [App (Just (37,14)-(37,41)) (Var (Just (37,15)-(37,20)) "build") [Tuple (Just (37,21)-(37,40)) [Var (Just (37,22)-(37,26)) "rand",Bop (Just (37,28)-(37,39)) Minus (Var (Just (37,29)-(37,34)) "depth") (Lit (Just (37,37)-(37,38)) (LI 1))]],App (Just (37,43)-(37,70)) (Var (Just (37,44)-(37,49)) "build") [Tuple (Just (37,50)-(37,69)) [Var (Just (37,51)-(37,55)) "rand",Bop (Just (37,57)-(37,68)) Minus (Var (Just (37,58)-(37,63)) "depth") (Lit (Just (37,66)-(37,67)) (LI 1))]]]
Var (Just (37,44)-(37,49)) "build"
Tuple (Just (37,50)-(37,69)) [Var (Just (37,51)-(37,55)) "rand",Bop (Just (37,57)-(37,68)) Minus (Var (Just (37,58)-(37,63)) "depth") (Lit (Just (37,66)-(37,67)) (LI 1))]
App (Just (39,11)-(41,72)) (Var (Just (39,11)-(39,22)) "buildThresh") [Tuple (Just (40,13)-(41,72)) [App (Just (40,14)-(40,41)) (Var (Just (40,15)-(40,20)) "build") [Tuple (Just (40,21)-(40,40)) [Var (Just (40,22)-(40,26)) "rand",Bop (Just (40,28)-(40,39)) Minus (Var (Just (40,29)-(40,34)) "depth") (Lit (Just (40,37)-(40,38)) (LI 1))]],App (Just (40,43)-(40,70)) (Var (Just (40,44)-(40,49)) "build") [Tuple (Just (40,50)-(40,69)) [Var (Just (40,51)-(40,55)) "rand",Bop (Just (40,57)-(40,68)) Minus (Var (Just (40,58)-(40,63)) "depth") (Lit (Just (40,66)-(40,67)) (LI 1))]],App (Just (41,15)-(41,42)) (Var (Just (41,16)-(41,21)) "build") [Tuple (Just (41,22)-(41,41)) [Var (Just (41,23)-(41,27)) "rand",Bop (Just (41,29)-(41,40)) Minus (Var (Just (41,30)-(41,35)) "depth") (Lit (Just (41,38)-(41,39)) (LI 1))]],App (Just (41,44)-(41,71)) (Var (Just (41,45)-(41,50)) "build") [Tuple (Just (41,51)-(41,70)) [Var (Just (41,52)-(41,56)) "rand",Bop (Just (41,58)-(41,69)) Minus (Var (Just (41,59)-(41,64)) "depth") (Lit (Just (41,67)-(41,68)) (LI 1))]]]]
Tuple (Just (40,13)-(41,72)) [App (Just (40,14)-(40,41)) (Var (Just (40,15)-(40,20)) "build") [Tuple (Just (40,21)-(40,40)) [Var (Just (40,22)-(40,26)) "rand",Bop (Just (40,28)-(40,39)) Minus (Var (Just (40,29)-(40,34)) "depth") (Lit (Just (40,37)-(40,38)) (LI 1))]],App (Just (40,43)-(40,70)) (Var (Just (40,44)-(40,49)) "build") [Tuple (Just (40,50)-(40,69)) [Var (Just (40,51)-(40,55)) "rand",Bop (Just (40,57)-(40,68)) Minus (Var (Just (40,58)-(40,63)) "depth") (Lit (Just (40,66)-(40,67)) (LI 1))]],App (Just (41,15)-(41,42)) (Var (Just (41,16)-(41,21)) "build") [Tuple (Just (41,22)-(41,41)) [Var (Just (41,23)-(41,27)) "rand",Bop (Just (41,29)-(41,40)) Minus (Var (Just (41,30)-(41,35)) "depth") (Lit (Just (41,38)-(41,39)) (LI 1))]],App (Just (41,44)-(41,71)) (Var (Just (41,45)-(41,50)) "build") [Tuple (Just (41,51)-(41,70)) [Var (Just (41,52)-(41,56)) "rand",Bop (Just (41,58)-(41,69)) Minus (Var (Just (41,59)-(41,64)) "depth") (Lit (Just (41,67)-(41,68)) (LI 1))]]]
*)

(* typed spans
(34,13)-(34,71)
(36,11)-(37,71)
(37,13)-(37,71)
(37,44)-(37,49)
(37,50)-(37,69)
(39,11)-(41,72)
(40,13)-(41,72)
*)

(* correct types
(expr * expr)
expr
(expr * expr)
((int * int) -> int * int) -> expr
((int * int) -> int * int)
expr
(expr * expr * expr * expr)
*)

(* bad types
expr
(expr * expr) -> expr
expr
(expr * expr * expr * expr) -> expr
(expr * expr * expr * expr) -> expr
(expr * expr * expr * expr) -> expr
expr
*)
