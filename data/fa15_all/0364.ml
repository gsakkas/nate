
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0, depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d ->
      if r = 0
      then buildCosine build (rand, (d - 1))
      else build (rand, (d - 1));;


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
  let r = rand (0, depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX () else buildY ()
  | d ->
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else build (rand, (d - 1));;

*)

(* changed spans
(11,20)-(11,28)
Sine e
ConAppG (Just VarG)

(20,31)-(20,37)
buildX ()
AppG (fromList [ConAppG Nothing])

(20,43)-(20,49)
()
ConAppG Nothing

(20,43)-(20,49)
buildY ()
AppG (fromList [ConAppG Nothing])

(22,6)-(24,32)
()
ConAppG Nothing

(23,11)-(23,44)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
ConApp (Just (11,18)-(11,24)) "Sine" (Just (Var (Just (11,23)-(11,24)) "e")) Nothing
App (Just (20,31)-(20,40)) (Var (Just (20,31)-(20,37)) "buildX") [ConApp (Just (20,38)-(20,40)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (20,38)-(20,40)) "()" Nothing (Just (TApp "unit" []))
App (Just (20,46)-(20,55)) (Var (Just (20,46)-(20,52)) "buildY") [ConApp (Just (20,53)-(20,55)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (20,53)-(20,55)) "()" Nothing (Just (TApp "unit" []))
App (Just (23,11)-(23,48)) (Var (Just (23,11)-(23,20)) "buildSine") [App (Just (23,21)-(23,48)) (Var (Just (23,22)-(23,27)) "build") [Tuple (Just (23,28)-(23,47)) [Var (Just (23,29)-(23,33)) "rand",Bop (Just (23,35)-(23,46)) Minus (Var (Just (23,36)-(23,41)) "depth") (Lit (Just (23,44)-(23,45)) (LI 1))]]]
*)

(* typed spans
(11,18)-(11,24)
(20,31)-(20,40)
(20,38)-(20,40)
(20,46)-(20,55)
(20,53)-(20,55)
(23,11)-(23,48)
*)

(* correct types
expr
expr
unit
expr
unit
expr
*)

(* bad types
expr
unit -> expr
unit -> expr
unit -> expr
unit -> expr
unit -> expr
*)
