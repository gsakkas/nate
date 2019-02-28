
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildECosSin (a,b) = ECosSin (a, b);;

let buildSinLog (a,b,c) = SinLog (a, b, c);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (8, 10) else (1, 8)) in
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
  | 6 ->
      buildECosSin ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildSinLog ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 8 -> VarX
  | 9 -> VarY;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildECosSin (a,b) = ECosSin (a, b);;

let buildSinLog (a,b,c) = SinLog (a, b, c);;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  let r = rand (if depth = 0 then (8, 10) else (1, 8)) in
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
  | 6 ->
      buildECosSin ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildSinLog
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))))
  | 8 -> VarX
  | 9 -> VarY;;

*)

(* changed spans
(43,18)-(43,76)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (44,8)-(45,38)) [App (Just (44,9)-(44,36)) (Var (Just (44,10)-(44,15)) "build") [Tuple (Just (44,16)-(44,35)) [Var (Just (44,17)-(44,21)) "rand",Bop (Just (44,23)-(44,34)) Minus (Var (Just (44,24)-(44,29)) "depth") (Lit (Just (44,32)-(44,33)) (LI 1))]],App (Just (44,38)-(44,65)) (Var (Just (44,39)-(44,44)) "build") [Tuple (Just (44,45)-(44,64)) [Var (Just (44,46)-(44,50)) "rand",Bop (Just (44,52)-(44,63)) Minus (Var (Just (44,53)-(44,58)) "depth") (Lit (Just (44,61)-(44,62)) (LI 1))]],App (Just (45,10)-(45,37)) (Var (Just (45,11)-(45,16)) "build") [Tuple (Just (45,17)-(45,36)) [Var (Just (45,18)-(45,22)) "rand",Bop (Just (45,24)-(45,35)) Minus (Var (Just (45,25)-(45,30)) "depth") (Lit (Just (45,33)-(45,34)) (LI 1))]]]
*)

(* typed spans
(44,8)-(45,38)
*)

(* correct types
(expr * expr * expr)
*)

(* bad types
(expr * expr)
*)
