
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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        (if depth = 0
         then buildX ()
         else
           ((build (rand, (depth - 1))),
             (if depth = 0 then buildY () else build (rand, (depth - 1)))))
  | 6 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
  | 7 ->
      buildThresh
        ((build (rand, depth)), (build (rand, depth)), (build (rand, depth)),
          (build (rand, depth)));;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
  | 7 ->
      buildThresh
        ((build (rand, depth)), (build (rand, depth)), (build (rand, depth)),
          (build (rand, depth)));;

*)

(* changed spans
(36,8)-(40,75)
(if depth = 0
 then buildX ()
 else build (rand , depth - 1) , if depth = 0
                                 then buildY ()
                                 else build (rand , depth - 1))
TupleG (fromList [IteG EmptyG EmptyG EmptyG])

*)

(* changed exprs
Tuple (Just (36,8)-(37,71)) [Ite (Just (36,9)-(36,69)) (Bop (Just (36,13)-(36,22)) Eq (Var (Just (36,13)-(36,18)) "depth") (Lit (Just (36,21)-(36,22)) (LI 0))) (App (Just (36,28)-(36,37)) (Var (Just (36,28)-(36,34)) "buildX") [ConApp (Just (36,35)-(36,37)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (36,43)-(36,68)) (Var (Just (36,43)-(36,48)) "build") [Tuple (Just (36,49)-(36,68)) [Var (Just (36,50)-(36,54)) "rand",Bop (Just (36,56)-(36,67)) Minus (Var (Just (36,57)-(36,62)) "depth") (Lit (Just (36,65)-(36,66)) (LI 1))]]),Ite (Just (37,10)-(37,70)) (Bop (Just (37,14)-(37,23)) Eq (Var (Just (37,14)-(37,19)) "depth") (Lit (Just (37,22)-(37,23)) (LI 0))) (App (Just (37,29)-(37,38)) (Var (Just (37,29)-(37,35)) "buildY") [ConApp (Just (37,36)-(37,38)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (37,44)-(37,69)) (Var (Just (37,44)-(37,49)) "build") [Tuple (Just (37,50)-(37,69)) [Var (Just (37,51)-(37,55)) "rand",Bop (Just (37,57)-(37,68)) Minus (Var (Just (37,58)-(37,63)) "depth") (Lit (Just (37,66)-(37,67)) (LI 1))]])]
*)

(* typed spans
(36,8)-(37,71)
*)

(* correct types
(expr * expr)
*)

(* bad types
(expr * expr)
*)
