
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
  | 0 -> (match rand (0, 1) with | 0 -> VarX | 1 -> VarY)
  | n ->
      (match rand (0, 6) with
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
               (build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1)))));;


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
  | 0 -> (match rand (0, 1) with | 0 -> VarX | 1 -> VarY)
  | n ->
      (match rand (0, 6) with
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
(42,13)-(44,43)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (42,13)-(43,72)) [App (Just (42,14)-(42,41)) (Var (Just (42,15)-(42,20)) "build") [Tuple (Just (42,21)-(42,40)) [Var (Just (42,22)-(42,26)) "rand",Bop (Just (42,28)-(42,39)) Minus (Var (Just (42,29)-(42,34)) "depth") (Lit (Just (42,37)-(42,38)) (LI 1))]],App (Just (42,43)-(42,70)) (Var (Just (42,44)-(42,49)) "build") [Tuple (Just (42,50)-(42,69)) [Var (Just (42,51)-(42,55)) "rand",Bop (Just (42,57)-(42,68)) Minus (Var (Just (42,58)-(42,63)) "depth") (Lit (Just (42,66)-(42,67)) (LI 1))]],App (Just (43,15)-(43,42)) (Var (Just (43,16)-(43,21)) "build") [Tuple (Just (43,22)-(43,41)) [Var (Just (43,23)-(43,27)) "rand",Bop (Just (43,29)-(43,40)) Minus (Var (Just (43,30)-(43,35)) "depth") (Lit (Just (43,38)-(43,39)) (LI 1))]],App (Just (43,44)-(43,71)) (Var (Just (43,45)-(43,50)) "build") [Tuple (Just (43,51)-(43,70)) [Var (Just (43,52)-(43,56)) "rand",Bop (Just (43,58)-(43,69)) Minus (Var (Just (43,59)-(43,64)) "depth") (Lit (Just (43,67)-(43,68)) (LI 1))]]]
*)

(* typed spans
(42,13)-(43,72)
*)

(* correct types
(expr * expr * expr * expr)
*)

(* bad types
(expr * expr * expr * expr * expr)
*)
