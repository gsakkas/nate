
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
  let r = rand (if depth = 0 then (6, 7) else (1, 5)) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 -> buildAverage (build (rand, (depth - 1))) (build (rand, (depth - 1)))
  | 4 -> buildTimes (build (rand, (depth - 1))) (build (rand, (depth - 1)))
  | 5 ->
      buildThresh (build (rand, (depth - 1))) (build (rand, (depth - 1)))
        (build (rand, (depth - 1))) (build (rand, (depth - 1)))
  | 6 -> VarX
  | 7 -> VarY;;


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

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (6, 7) else (1, 5)) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 -> VarX
  | 7 -> VarY;;

*)

(* changed spans
(26,9)-(26,77)
buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(27,9)-(27,75)
buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(29,6)-(30,63)
buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (27,6)-(27,77)) (Var (Just (27,6)-(27,18)) "buildAverage") [Tuple (Just (27,19)-(27,77)) [App (Just (27,20)-(27,47)) (Var (Just (27,21)-(27,26)) "build") [Tuple (Just (27,27)-(27,46)) [Var (Just (27,28)-(27,32)) "rand",Bop (Just (27,34)-(27,45)) Minus (Var (Just (27,35)-(27,40)) "depth") (Lit (Just (27,43)-(27,44)) (LI 1))]],App (Just (27,49)-(27,76)) (Var (Just (27,50)-(27,55)) "build") [Tuple (Just (27,56)-(27,75)) [Var (Just (27,57)-(27,61)) "rand",Bop (Just (27,63)-(27,74)) Minus (Var (Just (27,64)-(27,69)) "depth") (Lit (Just (27,72)-(27,73)) (LI 1))]]]]
App (Just (29,6)-(29,75)) (Var (Just (29,6)-(29,16)) "buildTimes") [Tuple (Just (29,17)-(29,75)) [App (Just (29,18)-(29,45)) (Var (Just (29,19)-(29,24)) "build") [Tuple (Just (29,25)-(29,44)) [Var (Just (29,26)-(29,30)) "rand",Bop (Just (29,32)-(29,43)) Minus (Var (Just (29,33)-(29,38)) "depth") (Lit (Just (29,41)-(29,42)) (LI 1))]],App (Just (29,47)-(29,74)) (Var (Just (29,48)-(29,53)) "build") [Tuple (Just (29,54)-(29,73)) [Var (Just (29,55)-(29,59)) "rand",Bop (Just (29,61)-(29,72)) Minus (Var (Just (29,62)-(29,67)) "depth") (Lit (Just (29,70)-(29,71)) (LI 1))]]]]
App (Just (31,6)-(33,67)) (Var (Just (31,6)-(31,17)) "buildThresh") [Tuple (Just (32,8)-(33,67)) [App (Just (32,9)-(32,36)) (Var (Just (32,10)-(32,15)) "build") [Tuple (Just (32,16)-(32,35)) [Var (Just (32,17)-(32,21)) "rand",Bop (Just (32,23)-(32,34)) Minus (Var (Just (32,24)-(32,29)) "depth") (Lit (Just (32,32)-(32,33)) (LI 1))]],App (Just (32,38)-(32,65)) (Var (Just (32,39)-(32,44)) "build") [Tuple (Just (32,45)-(32,64)) [Var (Just (32,46)-(32,50)) "rand",Bop (Just (32,52)-(32,63)) Minus (Var (Just (32,53)-(32,58)) "depth") (Lit (Just (32,61)-(32,62)) (LI 1))]],App (Just (33,10)-(33,37)) (Var (Just (33,11)-(33,16)) "build") [Tuple (Just (33,17)-(33,36)) [Var (Just (33,18)-(33,22)) "rand",Bop (Just (33,24)-(33,35)) Minus (Var (Just (33,25)-(33,30)) "depth") (Lit (Just (33,33)-(33,34)) (LI 1))]],App (Just (33,39)-(33,66)) (Var (Just (33,40)-(33,45)) "build") [Tuple (Just (33,46)-(33,65)) [Var (Just (33,47)-(33,51)) "rand",Bop (Just (33,53)-(33,64)) Minus (Var (Just (33,54)-(33,59)) "depth") (Lit (Just (33,62)-(33,63)) (LI 1))]]]]
*)

(* typed spans
(27,6)-(27,77)
(29,6)-(29,75)
(31,6)-(33,67)
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
