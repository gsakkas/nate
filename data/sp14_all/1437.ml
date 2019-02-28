
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> let r = rand (0, 2) in if r = 0 then buildX () else buildY ()
  | _ ->
      let r = rand (0, 5) in
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else
        if r = 1
        then buildCosine (build (rand, (depth - 1)))
        else
          if r = 2
          then
            buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if r = 3
            then
              buildTimes
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> let r = rand (0, 2) in if r = 0 then buildX () else buildY ()
  | _ ->
      let r = rand (0, 5) in
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else
        if r = 1
        then buildCosine (build (rand, (depth - 1)))
        else
          if r = 2
          then
            buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if r = 3
            then
              buildTimes
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
            else
              buildThresh
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                  (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(17,16)-(17,39)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(39,12)-(42,74)
buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (17,17)-(17,67)) (TuplePat (Just (17,17)-(17,34)) [VarPat (Just (17,17)-(17,18)) "a",VarPat (Just (17,19)-(17,20)) "b",VarPat (Just (17,21)-(17,27)) "a_less",VarPat (Just (17,28)-(17,34)) "b_less"]) (ConApp (Just (17,38)-(17,67)) "Thresh" (Just (Tuple (Just (17,45)-(17,67)) [Var (Just (17,46)-(17,47)) "a",Var (Just (17,49)-(17,50)) "b",Var (Just (17,52)-(17,58)) "a_less",Var (Just (17,60)-(17,66)) "b_less"])) Nothing) Nothing
App (Just (46,14)-(48,75)) (Var (Just (46,14)-(46,25)) "buildThresh") [Tuple (Just (47,16)-(48,75)) [App (Just (47,17)-(47,44)) (Var (Just (47,18)-(47,23)) "build") [Tuple (Just (47,24)-(47,43)) [Var (Just (47,25)-(47,29)) "rand",Bop (Just (47,31)-(47,42)) Minus (Var (Just (47,32)-(47,37)) "depth") (Lit (Just (47,40)-(47,41)) (LI 1))]],App (Just (47,46)-(47,73)) (Var (Just (47,47)-(47,52)) "build") [Tuple (Just (47,53)-(47,72)) [Var (Just (47,54)-(47,58)) "rand",Bop (Just (47,60)-(47,71)) Minus (Var (Just (47,61)-(47,66)) "depth") (Lit (Just (47,69)-(47,70)) (LI 1))]],App (Just (48,18)-(48,45)) (Var (Just (48,19)-(48,24)) "build") [Tuple (Just (48,25)-(48,44)) [Var (Just (48,26)-(48,30)) "rand",Bop (Just (48,32)-(48,43)) Minus (Var (Just (48,33)-(48,38)) "depth") (Lit (Just (48,41)-(48,42)) (LI 1))]],App (Just (48,47)-(48,74)) (Var (Just (48,48)-(48,53)) "build") [Tuple (Just (48,54)-(48,73)) [Var (Just (48,55)-(48,59)) "rand",Bop (Just (48,61)-(48,72)) Minus (Var (Just (48,62)-(48,67)) "depth") (Lit (Just (48,70)-(48,71)) (LI 1))]]]]
*)

(* typed spans
(17,17)-(17,67)
(46,14)-(48,75)
*)

(* correct types
(expr * expr * expr * expr) -> expr
expr
*)

(* bad types
(expr * expr) -> expr
unit
*)
