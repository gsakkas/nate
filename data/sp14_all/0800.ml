
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

let buildSqrt e = Sqrt e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (0, 2) with | 0 -> VarX | 1 -> VarY | _ -> VarY)
  | _ ->
      let next = build (rand, (depth - 1)) in
      (match rand (1, 8) with
       | 1 -> buildSine next
       | 2 -> buildCosine next
       | 3 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 4 -> buildTimes (next, (build (rand, (depth - 1))))
       | 5 ->
           buildThresh
             (next, (build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))))
       | 6 -> buildSqrt next
       | 7 ->
           buildGauss
             (next, (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ -> abs next);;


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

let buildAbs e = Abs e;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildGauss (e1,e2,e3) = Gauss (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSqrt e = Sqrt e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (0, 2) with | 0 -> VarX | 1 -> VarY | _ -> VarY)
  | _ ->
      let next = build (rand, (depth - 1)) in
      (match rand (1, 8) with
       | 1 -> buildSine next
       | 2 -> buildCosine next
       | 3 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 4 -> buildTimes (next, (build (rand, (depth - 1))))
       | 5 ->
           buildThresh
             (next, (build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))))
       | 6 -> buildSqrt next
       | 7 ->
           buildGauss
             (next, (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ -> buildAbs next);;

*)

(* changed spans
(14,18)-(14,43)
fun e -> Abs e
LamG (ConAppG (Just VarG))

(48,14)-(48,17)
buildAbs
VarG

*)

(* changed exprs
Lam (Just (14,13)-(14,22)) (VarPat (Just (14,13)-(14,14)) "e") (ConApp (Just (14,17)-(14,22)) "Abs" (Just (Var (Just (14,21)-(14,22)) "e")) Nothing) Nothing
Var (Just (50,14)-(50,22)) "buildAbs"
*)

(* typed spans
(14,13)-(14,22)
(50,14)-(50,22)
*)

(* correct types
expr -> expr
expr -> expr
*)

(* bad types
(expr * expr) -> expr
int -> int
*)
