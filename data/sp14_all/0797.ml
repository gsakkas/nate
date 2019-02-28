
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildGauss (e1,e2,e3) = Gauss (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSqrt e = Sqrt (Abs e);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  match depth with
  | 0 -> VarX
  | _ ->
      let next = build (rand, (depth - 1)) in
      (match rand (1, 7) with
       | 1 -> buildSine next
       | 2 -> buildCosine next
       | 3 -> buildAverage (next, next)
       | 4 -> buildTimes next next
       | 5 -> buildThresh next next next next
       | 6 -> buildSqrt next
       | 7 -> buildGauss next next next);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildGauss (e1,e2,e3) = Gauss (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSqrt e = Sqrt (Abs e);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  match depth with
  | 0 -> VarX
  | _ ->
      let next = build (rand, (depth - 1)) in
      (match rand (1, 7) with
       | 1 -> buildSine next
       | 2 -> buildCosine next
       | 3 -> buildAverage (next, next)
       | 4 -> buildTimes (next, next)
       | 5 -> buildThresh (next, next, next, next)
       | 6 -> buildSqrt next
       | 7 -> buildGauss (next, next, next));;

*)

(* changed spans
(37,14)-(37,34)
buildTimes (next , next)
AppG (fromList [TupleG (fromList [EmptyG])])

(38,14)-(38,45)
buildThresh (next , next , next , next)
AppG (fromList [TupleG (fromList [EmptyG])])

(40,14)-(40,39)
buildGauss (next , next , next)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (37,14)-(37,37)) (Var (Just (37,14)-(37,24)) "buildTimes") [Tuple (Just (37,25)-(37,37)) [Var (Just (37,26)-(37,30)) "next",Var (Just (37,32)-(37,36)) "next"]]
App (Just (38,14)-(38,50)) (Var (Just (38,14)-(38,25)) "buildThresh") [Tuple (Just (38,26)-(38,50)) [Var (Just (38,27)-(38,31)) "next",Var (Just (38,33)-(38,37)) "next",Var (Just (38,39)-(38,43)) "next",Var (Just (38,45)-(38,49)) "next"]]
App (Just (40,14)-(40,43)) (Var (Just (40,14)-(40,24)) "buildGauss") [Tuple (Just (40,25)-(40,43)) [Var (Just (40,26)-(40,30)) "next",Var (Just (40,32)-(40,36)) "next",Var (Just (40,38)-(40,42)) "next"]]
*)

(* typed spans
(37,14)-(37,37)
(38,14)-(38,50)
(40,14)-(40,43)
*)

(* correct types
expr
expr
expr
*)

(* bad types
expr
expr
expr
*)
