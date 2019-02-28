
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
  | 0 -> let num = rand (1, 5) in if num > 3 then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then buildSine (build (rand, (depth - 1)))
      else buildCosine (build (rand, (depth - 1)))
  | 2 ->
      let num = rand (1, 3) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
      else
        buildTimes
          ((buildCosine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
  | 3 ->
      buildTimes
        (buildAverage
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> let num = rand (1, 5) in if num > 3 then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then buildSine (build (rand, (depth - 1)))
      else buildCosine (build (rand, (depth - 1)))
  | 2 ->
      let num = rand (1, 3) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
      else
        buildTimes
          ((buildCosine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
  | 3 ->
      buildTimes
        ((buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
          (build (rand, (depth - 1))));;

*)

(* changed spans
(44,8)-(45,70)
(buildAverage (build (rand , depth - 1) , build (rand , depth - 1)) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (44,8)-(46,38)) [App (Just (44,9)-(45,71)) (Var (Just (44,10)-(44,22)) "buildAverage") [Tuple (Just (45,12)-(45,70)) [App (Just (45,13)-(45,40)) (Var (Just (45,14)-(45,19)) "build") [Tuple (Just (45,20)-(45,39)) [Var (Just (45,21)-(45,25)) "rand",Bop (Just (45,27)-(45,38)) Minus (Var (Just (45,28)-(45,33)) "depth") (Lit (Just (45,36)-(45,37)) (LI 1))]],App (Just (45,42)-(45,69)) (Var (Just (45,43)-(45,48)) "build") [Tuple (Just (45,49)-(45,68)) [Var (Just (45,50)-(45,54)) "rand",Bop (Just (45,56)-(45,67)) Minus (Var (Just (45,57)-(45,62)) "depth") (Lit (Just (45,65)-(45,66)) (LI 1))]]]],App (Just (46,10)-(46,37)) (Var (Just (46,11)-(46,16)) "build") [Tuple (Just (46,17)-(46,36)) [Var (Just (46,18)-(46,22)) "rand",Bop (Just (46,24)-(46,35)) Minus (Var (Just (46,25)-(46,30)) "depth") (Lit (Just (46,33)-(46,34)) (LI 1))]]]
*)

(* typed spans
(44,8)-(46,38)
*)

(* correct types
(expr * expr)
*)

(* bad types
expr
*)
