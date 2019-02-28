
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

let rec build (rand,depth) =
  if depth <= 0
  then let x = rand (1, 2) in (if x = 1 then buildX () else buildY ());;


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
  if depth <= 0
  then let x = rand (1, 2) in (if x = 1 then buildX () else buildY ())
  else
    (let subtreeSize1 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let subtreeSize2 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let subtreeSize3 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let subtreeeSize4 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let x = rand (1, 5) in
     match x with | _ -> buildSine (build (rand, subtreeSize1)));;

*)

(* changed spans
(11,11)-(11,20)
fun e -> Sine e
LamG (ConAppG (Just VarG))

(16,2)-(17,70)
let subtreeSize1 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let subtreeSize2 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let subtreeSize3 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let subtreeeSize4 =
  if depth = 1
  then 0
  else rand (1 , depth - 1) in
let x = rand (1 , 5) in
match x with
| _ -> buildSine (build (rand , subtreeSize1))
LetG NonRec (fromList [IteG EmptyG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (11,14)-(11,24)) (VarPat (Just (11,14)-(11,15)) "e") (ConApp (Just (11,18)-(11,24)) "Sine" (Just (Var (Just (11,23)-(11,24)) "e")) Nothing) Nothing
Let (Just (21,4)-(26,64)) NonRec [(VarPat (Just (21,9)-(21,21)) "subtreeSize1",Ite (Just (21,24)-(21,70)) (Bop (Just (21,27)-(21,36)) Eq (Var (Just (21,27)-(21,32)) "depth") (Lit (Just (21,35)-(21,36)) (LI 1))) (Lit (Just (21,42)-(21,43)) (LI 0)) (App (Just (21,49)-(21,70)) (Var (Just (21,49)-(21,53)) "rand") [Tuple (Just (21,54)-(21,70)) [Lit (Just (21,55)-(21,56)) (LI 1),Bop (Just (21,58)-(21,69)) Minus (Var (Just (21,59)-(21,64)) "depth") (Lit (Just (21,67)-(21,68)) (LI 1))]]))] (Let (Just (22,5)-(26,63)) NonRec [(VarPat (Just (22,9)-(22,21)) "subtreeSize2",Ite (Just (22,24)-(22,70)) (Bop (Just (22,27)-(22,36)) Eq (Var (Just (22,27)-(22,32)) "depth") (Lit (Just (22,35)-(22,36)) (LI 1))) (Lit (Just (22,42)-(22,43)) (LI 0)) (App (Just (22,49)-(22,70)) (Var (Just (22,49)-(22,53)) "rand") [Tuple (Just (22,54)-(22,70)) [Lit (Just (22,55)-(22,56)) (LI 1),Bop (Just (22,58)-(22,69)) Minus (Var (Just (22,59)-(22,64)) "depth") (Lit (Just (22,67)-(22,68)) (LI 1))]]))] (Let (Just (23,5)-(26,63)) NonRec [(VarPat (Just (23,9)-(23,21)) "subtreeSize3",Ite (Just (23,24)-(23,70)) (Bop (Just (23,27)-(23,36)) Eq (Var (Just (23,27)-(23,32)) "depth") (Lit (Just (23,35)-(23,36)) (LI 1))) (Lit (Just (23,42)-(23,43)) (LI 0)) (App (Just (23,49)-(23,70)) (Var (Just (23,49)-(23,53)) "rand") [Tuple (Just (23,54)-(23,70)) [Lit (Just (23,55)-(23,56)) (LI 1),Bop (Just (23,58)-(23,69)) Minus (Var (Just (23,59)-(23,64)) "depth") (Lit (Just (23,67)-(23,68)) (LI 1))]]))] (Let (Just (24,5)-(26,63)) NonRec [(VarPat (Just (24,9)-(24,22)) "subtreeeSize4",Ite (Just (24,25)-(24,71)) (Bop (Just (24,28)-(24,37)) Eq (Var (Just (24,28)-(24,33)) "depth") (Lit (Just (24,36)-(24,37)) (LI 1))) (Lit (Just (24,43)-(24,44)) (LI 0)) (App (Just (24,50)-(24,71)) (Var (Just (24,50)-(24,54)) "rand") [Tuple (Just (24,55)-(24,71)) [Lit (Just (24,56)-(24,57)) (LI 1),Bop (Just (24,59)-(24,70)) Minus (Var (Just (24,60)-(24,65)) "depth") (Lit (Just (24,68)-(24,69)) (LI 1))]]))] (Let (Just (25,5)-(26,63)) NonRec [(VarPat (Just (25,9)-(25,10)) "x",App (Just (25,13)-(25,24)) (Var (Just (25,13)-(25,17)) "rand") [Tuple (Just (25,18)-(25,24)) [Lit (Just (25,19)-(25,20)) (LI 1),Lit (Just (25,22)-(25,23)) (LI 5)]])] (Case (Just (26,5)-(26,63)) (Var (Just (26,11)-(26,12)) "x") [(WildPat (Just (26,20)-(26,21)),Nothing,App (Just (26,25)-(26,63)) (Var (Just (26,25)-(26,34)) "buildSine") [App (Just (26,35)-(26,63)) (Var (Just (26,36)-(26,41)) "build") [Tuple (Just (26,42)-(26,62)) [Var (Just (26,43)-(26,47)) "rand",Var (Just (26,49)-(26,61)) "subtreeSize1"]]])])))))
*)

(* typed spans
(11,14)-(11,24)
(21,4)-(26,64)
*)

(* correct types
expr -> expr
expr
*)

(* bad types
unit -> expr
unit
*)
