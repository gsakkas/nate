
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

let buildOp1 e = Op1 e;;

let buildOp2 (a,b,a_less,b_less) = Op2 (a, b, a_less);;

let buildSine e = Sine e;;

let rec build (rand,depth) =
  if depth = (-1)
  then
    let randNum = rand (1, 2) in
    let randNum2 = rand (3, 4) in
    (if (randNum = 1) && (randNum2 = 3)
     then buildSine (buildOp1 (build (rand, (depth - 1))))
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
(17,14)-(17,24)
Sine e
ConAppG (Just VarG)

(17,14)-(17,24)
fun () -> VarX
LamG (ConAppG Nothing)

(22,4)-(32,46)
0
LitG

(27,7)-(32,45)
buildX
VarG

(20,2)-(32,46)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
ConApp (Just (13,18)-(13,24)) "Sine" (Just (Var (Just (13,23)-(13,24)) "e")) Nothing
Lam (Just (15,11)-(15,20)) (ConPat (Just (15,11)-(15,13)) "()" Nothing) (ConApp (Just (15,16)-(15,20)) "VarX" Nothing Nothing) Nothing
Lit (Just (18,13)-(18,14)) (LI 0)
Var (Just (18,31)-(18,37)) "buildX"
App (Just (18,47)-(18,56)) (Var (Just (18,47)-(18,53)) "buildX") [ConApp (Just (18,54)-(18,56)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(13,18)-(13,24)
(15,11)-(15,20)
(18,13)-(18,14)
(18,31)-(18,37)
(18,47)-(18,56)
*)

(* correct types
expr
unit -> expr
int
unit -> expr
expr
*)

(* bad types
expr -> expr
expr -> expr
unit
unit
unit
*)
