
let pi = 4.0 *. (atan 1.0);;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y);;

let rec build (rand,depth) =
  let r = rand (0, depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d ->
      if r = 0
      then eval ((build (rand, (d - 1))), 1, 2)
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
(2,9)-(2,26)
fun e -> Sine e
LamG (ConAppG (Just VarG))

(33,24)-(33,25)
buildX ()
AppG (fromList [ConAppG Nothing])

(33,31)-(33,37)
()
ConAppG Nothing

(33,31)-(33,37)
buildY ()
AppG (fromList [ConAppG Nothing])

(33,43)-(33,49)
()
ConAppG Nothing

(36,16)-(36,47)
buildSine
VarG

(36,36)-(36,37)
depth
VarG

*)

(* changed exprs
Lam (Just (11,14)-(11,24)) (VarPat (Just (11,14)-(11,15)) "e") (ConApp (Just (11,18)-(11,24)) "Sine" (Just (Var (Just (11,23)-(11,24)) "e")) Nothing) Nothing
App (Just (20,31)-(20,40)) (Var (Just (20,31)-(20,37)) "buildX") [ConApp (Just (20,38)-(20,40)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (20,38)-(20,40)) "()" Nothing (Just (TApp "unit" []))
App (Just (20,46)-(20,55)) (Var (Just (20,46)-(20,52)) "buildY") [ConApp (Just (20,53)-(20,55)) "()" Nothing (Just (TApp "unit" []))]
ConApp (Just (20,53)-(20,55)) "()" Nothing (Just (TApp "unit" []))
Var (Just (23,11)-(23,20)) "buildSine"
Var (Just (23,36)-(23,41)) "depth"
*)

(* typed spans
(11,14)-(11,24)
(20,31)-(20,40)
(20,38)-(20,40)
(20,46)-(20,55)
(20,53)-(20,55)
(23,11)-(23,20)
(23,36)-(23,41)
*)

(* correct types
expr -> expr
expr
unit
expr
unit
expr -> expr
int
*)

(* bad types
float
int
unit -> expr
unit -> expr
unit -> expr
(expr * int * int)
int
*)
