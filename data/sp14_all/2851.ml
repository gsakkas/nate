
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
       | _ when r < 20 ->
           buildAverage
             ((buildCosine (build (rand, (depth - 1)))),
               (buildSine (build (rand, (depth - 1)))))
       | _ when (r < 30) && (r > 20) ->
           buildThresh
             ((build (rand, (depth - 1))),
               (buildCosine (build (rand, (depth - 1)))))
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
       | _ when r < 20 ->
           buildAverage
             ((buildCosine (build (rand, (depth - 1)))),
               (buildSine (build (rand, (depth - 1)))))
       | _ when (r < 30) && (r > 20) ->
           buildThresh
             ((build (rand, (depth - 1))),
               (buildCosine (build (rand, (depth - 1)))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ -> buildCosine (build (rand, (depth - 1))));;

*)

(* changed spans
(37,13)-(38,57)
(build (rand , depth - 1) , buildCosine (build (rand , depth - 1)) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(38,15)-(38,56)
buildCosine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (37,13)-(39,72)) [App (Just (37,14)-(37,41)) (Var (Just (37,15)-(37,20)) "build") [Tuple (Just (37,21)-(37,40)) [Var (Just (37,22)-(37,26)) "rand",Bop (Just (37,28)-(37,39)) Minus (Var (Just (37,29)-(37,34)) "depth") (Lit (Just (37,37)-(37,38)) (LI 1))]],App (Just (38,15)-(38,56)) (Var (Just (38,16)-(38,27)) "buildCosine") [App (Just (38,28)-(38,55)) (Var (Just (38,29)-(38,34)) "build") [Tuple (Just (38,35)-(38,54)) [Var (Just (38,36)-(38,40)) "rand",Bop (Just (38,42)-(38,53)) Minus (Var (Just (38,43)-(38,48)) "depth") (Lit (Just (38,51)-(38,52)) (LI 1))]]],App (Just (39,15)-(39,42)) (Var (Just (39,16)-(39,21)) "build") [Tuple (Just (39,22)-(39,41)) [Var (Just (39,23)-(39,27)) "rand",Bop (Just (39,29)-(39,40)) Minus (Var (Just (39,30)-(39,35)) "depth") (Lit (Just (39,38)-(39,39)) (LI 1))]],App (Just (39,44)-(39,71)) (Var (Just (39,45)-(39,50)) "build") [Tuple (Just (39,51)-(39,70)) [Var (Just (39,52)-(39,56)) "rand",Bop (Just (39,58)-(39,69)) Minus (Var (Just (39,59)-(39,64)) "depth") (Lit (Just (39,67)-(39,68)) (LI 1))]]]
App (Just (40,14)-(40,53)) (Var (Just (40,14)-(40,25)) "buildCosine") [App (Just (40,26)-(40,53)) (Var (Just (40,27)-(40,32)) "build") [Tuple (Just (40,33)-(40,52)) [Var (Just (40,34)-(40,38)) "rand",Bop (Just (40,40)-(40,51)) Minus (Var (Just (40,41)-(40,46)) "depth") (Lit (Just (40,49)-(40,50)) (LI 1))]]]
*)

(* typed spans
(37,13)-(39,72)
(40,14)-(40,53)
*)

(* correct types
(expr * expr * expr * expr)
expr
*)

(* bad types
(expr * expr)
expr
*)
