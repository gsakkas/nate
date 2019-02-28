
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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> (buildX ()) || (buildY ())
  | _ ->
      (buildSine (build (rand, (depth - 1)))) ||
        ((buildCosine (build (rand, (depth - 1)))) ||
           (buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))));;


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
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ ->
      (match rand (0, 4) with
       | 0 -> buildSine (build (rand, (depth - 1)))
       | 1 -> buildCosine (build (rand, (depth - 1)))
       | 2 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 3 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(17,11)-(17,20)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(17,11)-(17,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(23,9)-(23,35)
if rand (0 , 1) = 0
then buildX ()
else buildY ()
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(25,6)-(28,74)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Lam (Just (17,17)-(17,67)) (TuplePat (Just (17,17)-(17,34)) [VarPat (Just (17,17)-(17,18)) "a",VarPat (Just (17,19)-(17,20)) "b",VarPat (Just (17,21)-(17,27)) "a_less",VarPat (Just (17,28)-(17,34)) "b_less"]) (ConApp (Just (17,38)-(17,67)) "Thresh" (Just (Tuple (Just (17,45)-(17,67)) [Var (Just (17,46)-(17,47)) "a",Var (Just (17,49)-(17,50)) "b",Var (Just (17,52)-(17,58)) "a_less",Var (Just (17,60)-(17,66)) "b_less"])) Nothing) Nothing
Lam (Just (19,16)-(19,39)) (TuplePat (Just (19,16)-(19,21)) [VarPat (Just (19,16)-(19,18)) "e1",VarPat (Just (19,19)-(19,21)) "e2"]) (ConApp (Just (19,25)-(19,39)) "Times" (Just (Tuple (Just (19,31)-(19,39)) [Var (Just (19,32)-(19,34)) "e1",Var (Just (19,36)-(19,38)) "e2"])) Nothing) Nothing
Ite (Just (27,9)-(27,59)) (Bop (Just (27,12)-(27,29)) Eq (App (Just (27,12)-(27,25)) (Var (Just (27,13)-(27,17)) "rand") [Tuple (Just (27,18)-(27,24)) [Lit (Just (27,19)-(27,20)) (LI 0),Lit (Just (27,22)-(27,23)) (LI 1)]]) (Lit (Just (27,28)-(27,29)) (LI 0))) (App (Just (27,35)-(27,44)) (Var (Just (27,35)-(27,41)) "buildX") [ConApp (Just (27,42)-(27,44)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (27,50)-(27,59)) (Var (Just (27,50)-(27,56)) "buildY") [ConApp (Just (27,57)-(27,59)) "()" Nothing (Just (TApp "unit" []))])
Case (Just (29,6)-(41,73)) (App (Just (29,13)-(29,24)) (Var (Just (29,13)-(29,17)) "rand") [Tuple (Just (29,18)-(29,24)) [Lit (Just (29,19)-(29,20)) (LI 0),Lit (Just (29,22)-(29,23)) (LI 4)]]) [(LitPat (Just (30,9)-(30,10)) (LI 0),Nothing,App (Just (30,14)-(30,51)) (Var (Just (30,14)-(30,23)) "buildSine") [App (Just (30,24)-(30,51)) (Var (Just (30,25)-(30,30)) "build") [Tuple (Just (30,31)-(30,50)) [Var (Just (30,32)-(30,36)) "rand",Bop (Just (30,38)-(30,49)) Minus (Var (Just (30,39)-(30,44)) "depth") (Lit (Just (30,47)-(30,48)) (LI 1))]]]),(LitPat (Just (31,9)-(31,10)) (LI 1),Nothing,App (Just (31,14)-(31,53)) (Var (Just (31,14)-(31,25)) "buildCosine") [App (Just (31,26)-(31,53)) (Var (Just (31,27)-(31,32)) "build") [Tuple (Just (31,33)-(31,52)) [Var (Just (31,34)-(31,38)) "rand",Bop (Just (31,40)-(31,51)) Minus (Var (Just (31,41)-(31,46)) "depth") (Lit (Just (31,49)-(31,50)) (LI 1))]]]),(LitPat (Just (32,9)-(32,10)) (LI 2),Nothing,App (Just (33,11)-(34,71)) (Var (Just (33,11)-(33,23)) "buildAverage") [Tuple (Just (34,13)-(34,71)) [App (Just (34,14)-(34,41)) (Var (Just (34,15)-(34,20)) "build") [Tuple (Just (34,21)-(34,40)) [Var (Just (34,22)-(34,26)) "rand",Bop (Just (34,28)-(34,39)) Minus (Var (Just (34,29)-(34,34)) "depth") (Lit (Just (34,37)-(34,38)) (LI 1))]],App (Just (34,43)-(34,70)) (Var (Just (34,44)-(34,49)) "build") [Tuple (Just (34,50)-(34,69)) [Var (Just (34,51)-(34,55)) "rand",Bop (Just (34,57)-(34,68)) Minus (Var (Just (34,58)-(34,63)) "depth") (Lit (Just (34,66)-(34,67)) (LI 1))]]]]),(LitPat (Just (35,9)-(35,10)) (LI 3),Nothing,App (Just (36,11)-(37,71)) (Var (Just (36,11)-(36,21)) "buildTimes") [Tuple (Just (37,13)-(37,71)) [App (Just (37,14)-(37,41)) (Var (Just (37,15)-(37,20)) "build") [Tuple (Just (37,21)-(37,40)) [Var (Just (37,22)-(37,26)) "rand",Bop (Just (37,28)-(37,39)) Minus (Var (Just (37,29)-(37,34)) "depth") (Lit (Just (37,37)-(37,38)) (LI 1))]],App (Just (37,43)-(37,70)) (Var (Just (37,44)-(37,49)) "build") [Tuple (Just (37,50)-(37,69)) [Var (Just (37,51)-(37,55)) "rand",Bop (Just (37,57)-(37,68)) Minus (Var (Just (37,58)-(37,63)) "depth") (Lit (Just (37,66)-(37,67)) (LI 1))]]]]),(WildPat (Just (38,9)-(38,10)),Nothing,App (Just (39,11)-(41,72)) (Var (Just (39,11)-(39,22)) "buildThresh") [Tuple (Just (40,13)-(41,72)) [App (Just (40,14)-(40,41)) (Var (Just (40,15)-(40,20)) "build") [Tuple (Just (40,21)-(40,40)) [Var (Just (40,22)-(40,26)) "rand",Bop (Just (40,28)-(40,39)) Minus (Var (Just (40,29)-(40,34)) "depth") (Lit (Just (40,37)-(40,38)) (LI 1))]],App (Just (40,43)-(40,70)) (Var (Just (40,44)-(40,49)) "build") [Tuple (Just (40,50)-(40,69)) [Var (Just (40,51)-(40,55)) "rand",Bop (Just (40,57)-(40,68)) Minus (Var (Just (40,58)-(40,63)) "depth") (Lit (Just (40,66)-(40,67)) (LI 1))]],App (Just (41,15)-(41,42)) (Var (Just (41,16)-(41,21)) "build") [Tuple (Just (41,22)-(41,41)) [Var (Just (41,23)-(41,27)) "rand",Bop (Just (41,29)-(41,40)) Minus (Var (Just (41,30)-(41,35)) "depth") (Lit (Just (41,38)-(41,39)) (LI 1))]],App (Just (41,44)-(41,71)) (Var (Just (41,45)-(41,50)) "build") [Tuple (Just (41,51)-(41,70)) [Var (Just (41,52)-(41,56)) "rand",Bop (Just (41,58)-(41,69)) Minus (Var (Just (41,59)-(41,64)) "depth") (Lit (Just (41,67)-(41,68)) (LI 1))]]]])]
*)

(* typed spans
(17,17)-(17,67)
(19,16)-(19,39)
(27,9)-(27,59)
(29,6)-(41,73)
*)

(* correct types
(expr * expr * expr * expr) -> expr
(expr * expr) -> expr
expr
expr
*)

(* bad types
unit -> expr
unit -> expr
bool
bool
*)
