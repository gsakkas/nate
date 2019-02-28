
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Funny of expr* expr* expr
  | Funny1 of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildFunny (c,d,e) = Funny (c, d, e);;

let buildFunny1 f = Funny1 f;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand (0, 8) with
  | 0 -> if (rand (0, 2)) = 0 then buildX () else buildY ()
  | 1 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else buildSine (build (rand, (depth - 1)))
  | 2 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else buildCosine (build (rand, (depth - 1)))
  | 3 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else buildFunny (build (rand, (depth - 1)))
  | 7 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else buildFunny1 (build (rand, (depth - 1)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Funny of expr* expr* expr
  | Funny1 of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildFunny (c,d,e) = Funny (c, d, e);;

let buildFunny1 f = Funny1 f;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand (0, 8) with
  | 0 -> if (rand (0, 2)) = 0 then buildX () else buildY ()
  | 1 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else buildSine (build (rand, (depth - 1)))
  | 2 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else buildCosine (build (rand, (depth - 1)))
  | 3 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else
        buildFunny
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  | 7 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else buildFunny1 (build (rand, (depth - 1)));;

*)

(* changed spans
(63,22)-(63,49)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (65,10)-(66,40)) [App (Just (65,11)-(65,38)) (Var (Just (65,12)-(65,17)) "build") [Tuple (Just (65,18)-(65,37)) [Var (Just (65,19)-(65,23)) "rand",Bop (Just (65,25)-(65,36)) Minus (Var (Just (65,26)-(65,31)) "depth") (Lit (Just (65,34)-(65,35)) (LI 1))]],App (Just (65,40)-(65,67)) (Var (Just (65,41)-(65,46)) "build") [Tuple (Just (65,47)-(65,66)) [Var (Just (65,48)-(65,52)) "rand",Bop (Just (65,54)-(65,65)) Minus (Var (Just (65,55)-(65,60)) "depth") (Lit (Just (65,63)-(65,64)) (LI 1))]],App (Just (66,12)-(66,39)) (Var (Just (66,13)-(66,18)) "build") [Tuple (Just (66,19)-(66,38)) [Var (Just (66,20)-(66,24)) "rand",Bop (Just (66,26)-(66,37)) Minus (Var (Just (66,27)-(66,32)) "depth") (Lit (Just (66,35)-(66,36)) (LI 1))]]]
*)

(* typed spans
(65,10)-(66,40)
*)

(* correct types
(expr * expr * expr)
*)

(* bad types
expr
*)
