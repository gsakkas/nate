
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      let r = rand (3, 100) in
      (match r with
       | r when r < 5 ->
           ((buildAverage (build (rand, (depth - 1)))),
             (build (rand, (depth - 1))))
       | r when (r < 10) && (r > 5) ->
           buildThresh
             ((buildCosine (build (rand, (depth - 1)))),
               (buildCosine (build (rand, (depth - 1)))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | r when (r < 25) && (r > 20) -> buildSine (build (rand, (depth - 1)))
       | _ -> buildCosine (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      let r = rand (3, 100) in
      (match r with
       | r when r < 5 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | r when (r < 10) && (r > 5) ->
           buildThresh
             ((buildCosine (build (rand, (depth - 1)))),
               (buildCosine (build (rand, (depth - 1)))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | r when (r < 25) && (r > 20) -> buildSine (build (rand, (depth - 1)))
       | _ -> buildCosine (build (rand, (depth - 1))));;

*)

(* changed spans
(32,11)-(33,41)
r < 5
BopG VarG LitG

(32,11)-(33,41)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Bop (Just (31,16)-(31,21)) Lt (Var (Just (31,16)-(31,17)) "r") (Lit (Just (31,20)-(31,21)) (LI 5))
Tuple (Just (33,13)-(33,71)) [App (Just (33,14)-(33,41)) (Var (Just (33,15)-(33,20)) "build") [Tuple (Just (33,21)-(33,40)) [Var (Just (33,22)-(33,26)) "rand",Bop (Just (33,28)-(33,39)) Minus (Var (Just (33,29)-(33,34)) "depth") (Lit (Just (33,37)-(33,38)) (LI 1))]],App (Just (33,43)-(33,70)) (Var (Just (33,44)-(33,49)) "build") [Tuple (Just (33,50)-(33,69)) [Var (Just (33,51)-(33,55)) "rand",Bop (Just (33,57)-(33,68)) Minus (Var (Just (33,58)-(33,63)) "depth") (Lit (Just (33,66)-(33,67)) (LI 1))]]]
*)

(* typed spans
(31,16)-(31,21)
(33,13)-(33,71)
*)

(* correct types
bool
(expr * expr)
*)

(* bad types
(expr * (expr * expr))
(expr * (expr * expr))
*)
