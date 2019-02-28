
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand with
    | (0,2) -> buildX (build (rand, (depth - 1)))
    | (3,5) -> buildY ()
    | (6,10) -> buildSine (build (rand, (depth - 1)))
    | (11,18) -> buildCosine (build (rand, (depth - 1)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(22,4)-(26,56)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(20,2)-(26,56)
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (22,4)-(24,50)) (App (Just (22,10)-(22,21)) (Var (Just (22,10)-(22,14)) "rand") [Tuple (Just (22,15)-(22,21)) [Lit (Just (22,16)-(22,17)) (LI 0),Lit (Just (22,19)-(22,20)) (LI 4)]]) [(LitPat (Just (23,6)-(23,7)) (LI 0),Nothing,App (Just (23,11)-(23,48)) (Var (Just (23,11)-(23,20)) "buildSine") [App (Just (23,21)-(23,48)) (Var (Just (23,22)-(23,27)) "build") [Tuple (Just (23,28)-(23,47)) [Var (Just (23,29)-(23,33)) "rand",Bop (Just (23,35)-(23,46)) Minus (Var (Just (23,36)-(23,41)) "depth") (Lit (Just (23,44)-(23,45)) (LI 1))]]]),(LitPat (Just (24,6)-(24,7)) (LI 1),Nothing,App (Just (24,11)-(24,50)) (Var (Just (24,11)-(24,22)) "buildCosine") [App (Just (24,23)-(24,50)) (Var (Just (24,24)-(24,29)) "build") [Tuple (Just (24,30)-(24,49)) [Var (Just (24,31)-(24,35)) "rand",Bop (Just (24,37)-(24,48)) Minus (Var (Just (24,38)-(24,43)) "depth") (Lit (Just (24,46)-(24,47)) (LI 1))]]])]
Case (Just (25,7)-(25,65)) (App (Just (25,14)-(25,25)) (Var (Just (25,14)-(25,18)) "rand") [Tuple (Just (25,19)-(25,25)) [Lit (Just (25,20)-(25,21)) (LI 0),Lit (Just (25,23)-(25,24)) (LI 1)]]) [(LitPat (Just (25,33)-(25,34)) (LI 0),Nothing,App (Just (25,38)-(25,47)) (Var (Just (25,38)-(25,44)) "buildX") [ConApp (Just (25,45)-(25,47)) "()" Nothing (Just (TApp "unit" []))]),(LitPat (Just (25,50)-(25,51)) (LI 1),Nothing,App (Just (25,55)-(25,64)) (Var (Just (25,55)-(25,61)) "buildY") [ConApp (Just (25,62)-(25,64)) "()" Nothing (Just (TApp "unit" []))])]
*)

(* typed spans
(22,4)-(24,50)
(25,7)-(25,65)
*)

(* correct types
expr
expr
*)

(* bad types
expr
unit
*)
