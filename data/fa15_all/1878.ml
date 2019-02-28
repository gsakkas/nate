
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> ()
  | 1 -> if (rand mod 2) = 0 then buildX else buildY
  | n when n > 1 -> buildSine (build (rand, (depth - 1)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if true then buildX () else buildY ()
  | n -> buildSine (build (rand, (depth - 1)));;

*)

(* changed spans
(18,2)-(21,57)
match depth with
| 0 -> if true
       then buildX ()
       else buildY ()
| n -> buildSine (build (rand , depth - 1))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (18,2)-(20,46)) (Var (Just (18,8)-(18,13)) "depth") [(LitPat (Just (19,4)-(19,5)) (LI 0),Nothing,Ite (Just (19,9)-(19,46)) (Lit (Just (19,12)-(19,16)) (LB True)) (App (Just (19,22)-(19,31)) (Var (Just (19,22)-(19,28)) "buildX") [ConApp (Just (19,29)-(19,31)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (19,37)-(19,46)) (Var (Just (19,37)-(19,43)) "buildY") [ConApp (Just (19,44)-(19,46)) "()" Nothing (Just (TApp "unit" []))])),(VarPat (Just (20,4)-(20,5)) "n",Nothing,App (Just (20,9)-(20,46)) (Var (Just (20,9)-(20,18)) "buildSine") [App (Just (20,19)-(20,46)) (Var (Just (20,20)-(20,25)) "build") [Tuple (Just (20,26)-(20,45)) [Var (Just (20,27)-(20,31)) "rand",Bop (Just (20,33)-(20,44)) Minus (Var (Just (20,34)-(20,39)) "depth") (Lit (Just (20,42)-(20,43)) (LI 1))]]])]
*)

(* typed spans
(18,2)-(20,46)
*)

(* correct types
expr
*)

(* bad types
unit
*)
