
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
    (if (randNum = 1) && (randNum2 = 3)
     then buildCosine (buildOp1 (buildX ()))
     else
       if (randNum = 1) && (randNum2 = 4)
       then
         buildSine
           (buildOp2
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                (build (rand, (depth - 1))))));;


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

(26,4)-(36,46)
depth = 0
BopG VarG LitG

(26,4)-(36,46)
depth
VarG

(29,10)-(29,21)
0
LitG

(29,23)-(29,31)
buildSine
VarG

(31,7)-(36,45)
buildX ()
AppG (fromList [ConAppG Nothing])

(31,7)-(36,45)
buildX
VarG

*)

(* changed exprs
ConApp (Just (13,18)-(13,24)) "Sine" (Just (Var (Just (13,23)-(13,24)) "e")) Nothing
Bop (Just (18,5)-(18,14)) Eq (Var (Just (18,5)-(18,10)) "depth") (Lit (Just (18,13)-(18,14)) (LI 0))
Var (Just (18,5)-(18,10)) "depth"
Lit (Just (18,13)-(18,14)) (LI 0)
Var (Just (18,20)-(18,29)) "buildSine"
App (Just (18,47)-(18,56)) (Var (Just (18,47)-(18,53)) "buildX") [ConApp (Just (18,54)-(18,56)) "()" Nothing (Just (TApp "unit" []))]
Var (Just (18,47)-(18,53)) "buildX"
*)

(* typed spans
(13,18)-(13,24)
(18,5)-(18,14)
(18,5)-(18,10)
(18,13)-(18,14)
(18,20)-(18,29)
(18,47)-(18,56)
(18,47)-(18,53)
*)

(* correct types
expr
bool
int
int
expr -> expr
expr
unit -> expr
*)

(* bad types
expr -> expr
unit
unit
expr -> expr
expr -> expr
unit
unit
*)
