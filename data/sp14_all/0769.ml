
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
  let randNum = rand (1, 2) in
  let randNum2 = rand (3, 4) in
  if (randNum = 1) && (randNum2 = 3)
  then buildSine (buildOp1 (buildX ()))
  else
    if (randNum = 1) && (randNum2 = 4)
    then buildSine (buildOp2 (buildX ()))
    else
      if (randNum = 2) && (randNum2 = 3)
      then buildCosine (buildOp1 (buildX ()))
      else buildCosine (buildOp2 (buildX ()));;


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

(24,2)-(34,45)
if depth = 0
then buildSine (buildX ())
else buildX ()
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(24,2)-(34,45)
depth = 0
BopG VarG LitG

(24,2)-(34,45)
depth
VarG

(29,36)-(29,37)
0
LitG

(30,29)-(30,40)
buildX
VarG

(30,29)-(30,40)
()
ConAppG Nothing

(32,6)-(34,45)
buildX ()
AppG (fromList [ConAppG Nothing])

(32,6)-(34,45)
buildX
VarG

(32,6)-(34,45)
()
ConAppG Nothing

*)

(* changed exprs
ConApp (Just (13,18)-(13,24)) "Sine" (Just (Var (Just (13,23)-(13,24)) "e")) Nothing
Ite (Just (18,2)-(18,56)) (Bop (Just (18,5)-(18,14)) Eq (Var (Just (18,5)-(18,10)) "depth") (Lit (Just (18,13)-(18,14)) (LI 0))) (App (Just (18,20)-(18,41)) (Var (Just (18,20)-(18,29)) "buildSine") [App (Just (18,30)-(18,41)) (Var (Just (18,31)-(18,37)) "buildX") [ConApp (Just (18,38)-(18,40)) "()" Nothing (Just (TApp "unit" []))]]) (App (Just (18,47)-(18,56)) (Var (Just (18,47)-(18,53)) "buildX") [ConApp (Just (18,54)-(18,56)) "()" Nothing (Just (TApp "unit" []))])
Bop (Just (18,5)-(18,14)) Eq (Var (Just (18,5)-(18,10)) "depth") (Lit (Just (18,13)-(18,14)) (LI 0))
Var (Just (18,5)-(18,10)) "depth"
Lit (Just (18,13)-(18,14)) (LI 0)
Var (Just (18,31)-(18,37)) "buildX"
ConApp (Just (18,38)-(18,40)) "()" Nothing (Just (TApp "unit" []))
App (Just (18,47)-(18,56)) (Var (Just (18,47)-(18,53)) "buildX") [ConApp (Just (18,54)-(18,56)) "()" Nothing (Just (TApp "unit" []))]
Var (Just (18,47)-(18,53)) "buildX"
ConApp (Just (18,54)-(18,56)) "()" Nothing (Just (TApp "unit" []))
*)

(* typed spans
(13,18)-(13,24)
(18,2)-(18,56)
(18,5)-(18,14)
(18,5)-(18,10)
(18,13)-(18,14)
(18,31)-(18,37)
(18,38)-(18,40)
(18,47)-(18,56)
(18,47)-(18,53)
(18,54)-(18,56)
*)

(* correct types
expr
expr
bool
int
int
unit -> expr
unit
expr
unit -> expr
unit
*)

(* bad types
expr -> expr
expr
expr
expr
int
expr
expr
expr
expr
expr
*)
