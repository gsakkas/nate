
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
  let r = rand 0.4 in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d ->
      if r = 0
      then buildSine build (r, (d - 1))
      else buildCosine build (r, (d - 1));;


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
(13,14)-(13,24)
Sine e
ConAppG (Just VarG)

(20,15)-(20,18)
(0 , depth)
TupleG (fromList [VarG,LitG])

(22,24)-(22,25)
buildX ()
AppG (fromList [ConAppG Nothing])

(22,31)-(22,37)
()
ConAppG Nothing

(22,31)-(22,37)
buildY ()
AppG (fromList [ConAppG Nothing])

(22,43)-(22,49)
()
ConAppG Nothing

(25,11)-(25,39)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(26,11)-(26,41)
build (rand , d - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
ConApp (Just (11,18)-(11,24)) "Sine" (Just (Var (Just (11,23)-(11,24)) "e")) Nothing
Tuple (Just (18,15)-(18,25)) [Lit (Just (18,16)-(18,17)) (LI 0),Var (Just (18,19)-(18,24)) "depth"]
App (Just (20,31)-(20,40)) (Var (Just (20,31)-(20,37)) "buildX") [ConApp (Just (20,38)-(20,40)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (20,38)-(20,40)) "()" Nothing (Just (TApp "unit" []))
App (Just (20,46)-(20,55)) (Var (Just (20,46)-(20,52)) "buildY") [ConApp (Just (20,53)-(20,55)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (20,53)-(20,55)) "()" Nothing (Just (TApp "unit" []))
App (Just (23,11)-(23,48)) (Var (Just (23,11)-(23,20)) "buildSine") [App (Just (23,21)-(23,48)) (Var (Just (23,22)-(23,27)) "build") [Tuple (Just (23,28)-(23,47)) [Var (Just (23,29)-(23,33)) "rand",Bop (Just (23,35)-(23,46)) Minus (Var (Just (23,36)-(23,41)) "depth") (Lit (Just (23,44)-(23,45)) (LI 1))]]]
App (Just (24,11)-(24,32)) (Var (Just (24,11)-(24,16)) "build") [Tuple (Just (24,17)-(24,32)) [Var (Just (24,18)-(24,22)) "rand",Bop (Just (24,24)-(24,31)) Minus (Var (Just (24,25)-(24,26)) "d") (Lit (Just (24,29)-(24,30)) (LI 1))]]
*)

(* typed spans
(11,18)-(11,24)
(18,15)-(18,25)
(20,31)-(20,40)
(20,38)-(20,40)
(20,46)-(20,55)
(20,53)-(20,55)
(23,11)-(23,48)
(24,11)-(24,32)
*)

(* correct types
expr
(int * int)
expr
unit
expr
unit
expr
expr
*)

(* bad types
expr -> expr
float
int
unit -> expr
unit -> expr
unit -> expr
unit -> expr
unit -> expr
*)
