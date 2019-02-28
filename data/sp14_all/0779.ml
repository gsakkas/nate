
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

let buildOp2 (a,b,a_less,b_less) = Op2 (a, b, a_less);;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth > (-1)
  then
    let randNum = rand (1, 2) in
    let randNum2 = rand (3, 4) in
    match (randNum, randNum2) with
    | (1,3) -> buildCosine (buildOp1 (buildX rand))
    | (1,4) ->
        buildSine
          (buildOp2
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1)))))
    | (2,3) -> buildCosine (buildOp1 (buildX ()))
    | (2,4) ->
        buildCosine
          (buildOp2
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1)))))
    | (x,y) -> failwith "didnt work";;


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

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0 then buildSine (buildX ()) else buildX ();;

*)

(* changed spans
(19,14)-(19,24)
Sine e
ConAppG (Just VarG)

(24,5)-(24,17)
depth = 0
BopG VarG LitG

(26,4)-(41,36)
0
LitG

(41,24)-(41,36)
buildX
VarG

*)

(* changed exprs
ConApp (Just (13,18)-(13,24)) "Sine" (Just (Var (Just (13,23)-(13,24)) "e")) Nothing
Bop (Just (18,5)-(18,14)) Eq (Var (Just (18,5)-(18,10)) "depth") (Lit (Just (18,13)-(18,14)) (LI 0))
Lit (Just (18,13)-(18,14)) (LI 0)
Var (Just (18,47)-(18,53)) "buildX"
*)

(* typed spans
(13,18)-(13,24)
(18,5)-(18,14)
(18,13)-(18,14)
(18,47)-(18,53)
*)

(* correct types
expr
bool
int
unit -> expr
*)

(* bad types
expr -> expr
bool
expr
string
*)
