
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildTangent (e1,e2) = Tangent (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      if (rand (0, 1)) = 1
      then
        ((buildTangent (build (rand, (depth - 1)))),
          (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildTangent (e1,e2) = Tangent (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      if (rand (0, 1)) = 1
      then
        buildTangent
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
      else
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(13,27)-(13,43)
Average (e1 , e2)
ConAppG (Just (TupleG (fromList [VarG])))

(13,27)-(13,43)
fun (e1 , e2) ->
  Tangent (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(25,8)-(26,38)
buildTangent (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(25,8)-(26,38)
buildTangent
VarG

(25,8)-(26,38)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

(23,6)-(26,38)
buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
ConApp (Just (13,27)-(13,43)) "Average" (Just (Tuple (Just (13,35)-(13,43)) [Var (Just (13,36)-(13,38)) "e1",Var (Just (13,40)-(13,42)) "e2"])) Nothing
Lam (Just (15,18)-(15,43)) (TuplePat (Just (15,18)-(15,23)) [VarPat (Just (15,18)-(15,20)) "e1",VarPat (Just (15,21)-(15,23)) "e2"]) (ConApp (Just (15,27)-(15,43)) "Tangent" (Just (Tuple (Just (15,35)-(15,43)) [Var (Just (15,36)-(15,38)) "e1",Var (Just (15,40)-(15,42)) "e2"])) Nothing) Nothing
App (Just (27,8)-(28,68)) (Var (Just (27,8)-(27,20)) "buildTangent") [Tuple (Just (28,10)-(28,68)) [App (Just (28,11)-(28,38)) (Var (Just (28,12)-(28,17)) "build") [Tuple (Just (28,18)-(28,37)) [Var (Just (28,19)-(28,23)) "rand",Bop (Just (28,25)-(28,36)) Minus (Var (Just (28,26)-(28,31)) "depth") (Lit (Just (28,34)-(28,35)) (LI 1))]],App (Just (28,40)-(28,67)) (Var (Just (28,41)-(28,46)) "build") [Tuple (Just (28,47)-(28,66)) [Var (Just (28,48)-(28,52)) "rand",Bop (Just (28,54)-(28,65)) Minus (Var (Just (28,55)-(28,60)) "depth") (Lit (Just (28,63)-(28,64)) (LI 1))]]]]
Var (Just (27,8)-(27,20)) "buildTangent"
Tuple (Just (28,10)-(28,68)) [App (Just (28,11)-(28,38)) (Var (Just (28,12)-(28,17)) "build") [Tuple (Just (28,18)-(28,37)) [Var (Just (28,19)-(28,23)) "rand",Bop (Just (28,25)-(28,36)) Minus (Var (Just (28,26)-(28,31)) "depth") (Lit (Just (28,34)-(28,35)) (LI 1))]],App (Just (28,40)-(28,67)) (Var (Just (28,41)-(28,46)) "build") [Tuple (Just (28,47)-(28,66)) [Var (Just (28,48)-(28,52)) "rand",Bop (Just (28,54)-(28,65)) Minus (Var (Just (28,55)-(28,60)) "depth") (Lit (Just (28,63)-(28,64)) (LI 1))]]]
App (Just (30,8)-(31,68)) (Var (Just (30,8)-(30,20)) "buildAverage") [Tuple (Just (31,10)-(31,68)) [App (Just (31,11)-(31,38)) (Var (Just (31,12)-(31,17)) "build") [Tuple (Just (31,18)-(31,37)) [Var (Just (31,19)-(31,23)) "rand",Bop (Just (31,25)-(31,36)) Minus (Var (Just (31,26)-(31,31)) "depth") (Lit (Just (31,34)-(31,35)) (LI 1))]],App (Just (31,40)-(31,67)) (Var (Just (31,41)-(31,46)) "build") [Tuple (Just (31,47)-(31,66)) [Var (Just (31,48)-(31,52)) "rand",Bop (Just (31,54)-(31,65)) Minus (Var (Just (31,55)-(31,60)) "depth") (Lit (Just (31,63)-(31,64)) (LI 1))]]]]
*)

(* typed spans
(13,27)-(13,43)
(15,18)-(15,43)
(27,8)-(28,68)
(27,8)-(27,20)
(28,10)-(28,68)
(30,8)-(31,68)
*)

(* correct types
expr
(expr * expr) -> expr
expr
(expr * expr) -> expr
(expr * expr)
expr
*)

(* bad types
expr
expr
(expr * (expr * expr))
(expr * (expr * expr))
(expr * (expr * expr))
unit
*)
