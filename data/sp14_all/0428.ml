
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
  match depth with
  | 0 ->
      let num = rand (1, 10) in
      if (num > 7) || (num = 2) then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then buildSine (buildCosine (rand, (depth - 1)))
      else
        buildSine
          (buildTimes
             ((build (rand, (depth - 1))), (buildSine (rand, (depth - 1)))))
  | 2 ->
      let num = rand (1, 30) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
      else
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
  | 3 ->
      let num = rand (1, 50) in
      if (num mod 2) = 0
      then
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildCosine (build (rand, (depth - 1)))))
      else
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildSine (build (rand, (depth - 1)))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      let num = rand (1, 10) in
      if num = 1
      then buildSine (buildSine (buildSine (build (rand, (depth - 1)))))
      else
        if num = 2
        then
          buildCosine (buildCosine (buildCosine (build (rand, (depth - 1)))))
        else
          if num = 3
          then buildSine (buildCosine (build (rand, (depth - 1))))
          else buildCosine (buildSine (build (rand, (depth - 1))))
  | 6 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 8 ->
      buildTimes
        ((buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
          (buildSine (build (rand, (depth - 1)))))
  | _ -> build (rand, (depth - 1));;


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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 ->
      let num = rand (1, 10) in
      if (num > 7) || (num = 2) then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then
        buildSine
          (buildTimes
             ((build (rand, (depth - 1))),
               (buildCosine (build (rand, (depth - 1))))))
      else
        buildSine
          (buildTimes
             ((build (rand, (depth - 1))),
               (buildSine (build (rand, (depth - 1))))))
  | 2 ->
      let num = rand (1, 30) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
      else
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
  | 3 ->
      let num = rand (1, 50) in
      if (num mod 2) = 0
      then
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildCosine (build (rand, (depth - 1)))))
      else
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildSine (build (rand, (depth - 1)))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      let num = rand (1, 10) in
      if num = 1
      then buildSine (buildSine (buildSine (build (rand, (depth - 1)))))
      else
        if num = 2
        then
          buildCosine (buildCosine (buildCosine (build (rand, (depth - 1)))))
        else
          if num = 3
          then buildSine (buildCosine (build (rand, (depth - 1))))
          else buildCosine (buildSine (build (rand, (depth - 1))))
  | 6 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 8 ->
      buildTimes
        ((buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
          (buildSine (build (rand, (depth - 1)))))
  | _ -> build (rand, (depth - 1));;

*)

(* changed spans
(31,22)-(31,33)
buildTimes
VarG

(31,22)-(31,33)
(build (rand , depth - 1) , buildCosine (build (rand , depth - 1)))
TupleG (fromList [AppG (fromList [EmptyG])])

(31,34)-(31,53)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,54)-(35,73)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Var (Just (33,11)-(33,21)) "buildTimes"
Tuple (Just (34,13)-(35,57)) [App (Just (34,14)-(34,41)) (Var (Just (34,15)-(34,20)) "build") [Tuple (Just (34,21)-(34,40)) [Var (Just (34,22)-(34,26)) "rand",Bop (Just (34,28)-(34,39)) Minus (Var (Just (34,29)-(34,34)) "depth") (Lit (Just (34,37)-(34,38)) (LI 1))]],App (Just (35,15)-(35,56)) (Var (Just (35,16)-(35,27)) "buildCosine") [App (Just (35,28)-(35,55)) (Var (Just (35,29)-(35,34)) "build") [Tuple (Just (35,35)-(35,54)) [Var (Just (35,36)-(35,40)) "rand",Bop (Just (35,42)-(35,53)) Minus (Var (Just (35,43)-(35,48)) "depth") (Lit (Just (35,51)-(35,52)) (LI 1))]]]]
App (Just (35,28)-(35,55)) (Var (Just (35,29)-(35,34)) "build") [Tuple (Just (35,35)-(35,54)) [Var (Just (35,36)-(35,40)) "rand",Bop (Just (35,42)-(35,53)) Minus (Var (Just (35,43)-(35,48)) "depth") (Lit (Just (35,51)-(35,52)) (LI 1))]]
App (Just (40,26)-(40,53)) (Var (Just (40,27)-(40,32)) "build") [Tuple (Just (40,33)-(40,52)) [Var (Just (40,34)-(40,38)) "rand",Bop (Just (40,40)-(40,51)) Minus (Var (Just (40,41)-(40,46)) "depth") (Lit (Just (40,49)-(40,50)) (LI 1))]]
*)

(* typed spans
(33,11)-(33,21)
(34,13)-(35,57)
(35,28)-(35,55)
(40,26)-(40,53)
*)

(* correct types
(expr * expr) -> expr
(expr * expr)
expr
expr
*)

(* bad types
expr -> expr
expr -> expr
((int * int) -> int * int)
((int * int) -> int * int)
*)
