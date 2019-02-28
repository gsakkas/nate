
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildOp2 (a,b,a_less,b_less) = Op2 (a, b, a_less);;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0
  then buildSine (buildX ())
  else
    (let randNum = rand (1, 2) in
     let randNum2 = rand (1, 2) in
     let randNum3 = rand (1, 2) in
     match (randNum, randNum2) with
     | (1,1) -> buildSine (build (rand, (depth - 1)))
     | (2,2) -> buildCosine (build (rand, (depth - 1)))
     | _ ->
         (match randNum3 with
          | 1 ->
              buildSine
                (buildOp2
                   ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                     (build (rand, (depth - 1)))))
          | 2 ->
              buildCosine
                (buildOp2
                   ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                     (build (rand, (depth - 1)))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildOp1 e = Op1 e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0
  then buildSine (buildX ())
  else
    (let randNum = rand (1, 2) in
     let randNum2 = rand (1, 2) in
     let randNum3 = rand (1, 2) in
     match (randNum, randNum2) with
     | (1,1) -> buildSine (build (rand, (depth - 1)))
     | (2,2) -> buildCosine (build (rand, (depth - 1)))
     | _ ->
         (match randNum3 with
          | 1 -> buildSine (buildOp1 (build (rand, (depth - 1))))
          | 2 -> buildCosine (buildOp1 (build (rand, (depth - 1))))));;

*)

(* changed spans
(17,14)-(17,24)
Op1 e
ConAppG (Just VarG)

(17,14)-(17,24)
fun e -> Sine e
LamG (ConAppG (Just VarG))

(36,19)-(37,49)
buildOp1
VarG

(41,19)-(42,49)
buildOp1
VarG

*)

(* changed exprs
ConApp (Just (15,17)-(15,22)) "Op1" (Just (Var (Just (15,21)-(15,22)) "e")) Nothing
Lam (Just (17,14)-(17,24)) (VarPat (Just (17,14)-(17,15)) "e") (ConApp (Just (17,18)-(17,24)) "Sine" (Just (Var (Just (17,23)-(17,24)) "e")) Nothing) Nothing
Var (Just (33,28)-(33,36)) "buildOp1"
Var (Just (34,30)-(34,38)) "buildOp1"
*)

(* typed spans
(15,17)-(15,22)
(17,14)-(17,24)
(33,28)-(33,36)
(34,30)-(34,38)
*)

(* correct types
expr
expr -> expr
expr -> expr
expr -> expr
*)

(* bad types
expr -> expr
expr -> expr
(expr * expr * expr)
(expr * expr * expr)
*)
