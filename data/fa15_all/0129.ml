
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

let rec build (rand,depth) =
  if depth > 0
  then
    match rand with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
    | 2 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ -> false;;


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
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
    | 2 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 3 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  else (match rand (0, 1) with | 0 -> buildX () | _ -> buildY ());;

*)

(* changed spans
(17,15)-(26,16)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(17,15)-(26,16)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(17,15)-(26,16)
fun () -> VarX
LamG (ConAppG Nothing)

(17,15)-(26,16)
fun () -> VarY
LamG (ConAppG Nothing)

(20,4)-(26,16)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(18,2)-(26,16)
match rand (0 , 1) with
| 0 -> buildX ()
| _ -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Lam (Just (17,17)-(17,67)) (TuplePat (Just (17,17)-(17,34)) [VarPat (Just (17,17)-(17,18)) "a",VarPat (Just (17,19)-(17,20)) "b",VarPat (Just (17,21)-(17,27)) "a_less",VarPat (Just (17,28)-(17,34)) "b_less"]) (ConApp (Just (17,38)-(17,67)) "Thresh" (Just (Tuple (Just (17,45)-(17,67)) [Var (Just (17,46)-(17,47)) "a",Var (Just (17,49)-(17,50)) "b",Var (Just (17,52)-(17,58)) "a_less",Var (Just (17,60)-(17,66)) "b_less"])) Nothing) Nothing
Lam (Just (19,16)-(19,39)) (TuplePat (Just (19,16)-(19,21)) [VarPat (Just (19,16)-(19,18)) "e1",VarPat (Just (19,19)-(19,21)) "e2"]) (ConApp (Just (19,25)-(19,39)) "Times" (Just (Tuple (Just (19,31)-(19,39)) [Var (Just (19,32)-(19,34)) "e1",Var (Just (19,36)-(19,38)) "e2"])) Nothing) Nothing
Lam (Just (21,11)-(21,20)) (ConPat (Just (21,11)-(21,13)) "()" Nothing) (ConApp (Just (21,16)-(21,20)) "VarX" Nothing Nothing) Nothing
Lam (Just (23,11)-(23,20)) (ConPat (Just (23,11)-(23,13)) "()" Nothing) (ConApp (Just (23,16)-(23,20)) "VarY" Nothing Nothing) Nothing
Case (Just (28,4)-(39,69)) (App (Just (28,10)-(28,21)) (Var (Just (28,10)-(28,14)) "rand") [Tuple (Just (28,15)-(28,21)) [Lit (Just (28,16)-(28,17)) (LI 0),Lit (Just (28,19)-(28,20)) (LI 4)]]) [(LitPat (Just (29,6)-(29,7)) (LI 0),Nothing,App (Just (29,11)-(29,48)) (Var (Just (29,11)-(29,20)) "buildSine") [App (Just (29,21)-(29,48)) (Var (Just (29,22)-(29,27)) "build") [Tuple (Just (29,28)-(29,47)) [Var (Just (29,29)-(29,33)) "rand",Bop (Just (29,35)-(29,46)) Minus (Var (Just (29,36)-(29,41)) "depth") (Lit (Just (29,44)-(29,45)) (LI 1))]]]),(LitPat (Just (30,6)-(30,7)) (LI 1),Nothing,App (Just (30,11)-(30,50)) (Var (Just (30,11)-(30,22)) "buildCosine") [App (Just (30,23)-(30,50)) (Var (Just (30,24)-(30,29)) "build") [Tuple (Just (30,30)-(30,49)) [Var (Just (30,31)-(30,35)) "rand",Bop (Just (30,37)-(30,48)) Minus (Var (Just (30,38)-(30,43)) "depth") (Lit (Just (30,46)-(30,47)) (LI 1))]]]),(LitPat (Just (31,6)-(31,7)) (LI 2),Nothing,App (Just (32,8)-(33,68)) (Var (Just (32,8)-(32,20)) "buildAverage") [Tuple (Just (33,10)-(33,68)) [App (Just (33,11)-(33,38)) (Var (Just (33,12)-(33,17)) "build") [Tuple (Just (33,18)-(33,37)) [Var (Just (33,19)-(33,23)) "rand",Bop (Just (33,25)-(33,36)) Minus (Var (Just (33,26)-(33,31)) "depth") (Lit (Just (33,34)-(33,35)) (LI 1))]],App (Just (33,40)-(33,67)) (Var (Just (33,41)-(33,46)) "build") [Tuple (Just (33,47)-(33,66)) [Var (Just (33,48)-(33,52)) "rand",Bop (Just (33,54)-(33,65)) Minus (Var (Just (33,55)-(33,60)) "depth") (Lit (Just (33,63)-(33,64)) (LI 1))]]]]),(LitPat (Just (34,6)-(34,7)) (LI 3),Nothing,App (Just (35,8)-(35,77)) (Var (Just (35,8)-(35,18)) "buildTimes") [Tuple (Just (35,19)-(35,77)) [App (Just (35,20)-(35,47)) (Var (Just (35,21)-(35,26)) "build") [Tuple (Just (35,27)-(35,46)) [Var (Just (35,28)-(35,32)) "rand",Bop (Just (35,34)-(35,45)) Minus (Var (Just (35,35)-(35,40)) "depth") (Lit (Just (35,43)-(35,44)) (LI 1))]],App (Just (35,49)-(35,76)) (Var (Just (35,50)-(35,55)) "build") [Tuple (Just (35,56)-(35,75)) [Var (Just (35,57)-(35,61)) "rand",Bop (Just (35,63)-(35,74)) Minus (Var (Just (35,64)-(35,69)) "depth") (Lit (Just (35,72)-(35,73)) (LI 1))]]]]),(WildPat (Just (36,6)-(36,7)),Nothing,App (Just (37,8)-(39,69)) (Var (Just (37,8)-(37,19)) "buildThresh") [Tuple (Just (38,10)-(39,69)) [App (Just (38,11)-(38,38)) (Var (Just (38,12)-(38,17)) "build") [Tuple (Just (38,18)-(38,37)) [Var (Just (38,19)-(38,23)) "rand",Bop (Just (38,25)-(38,36)) Minus (Var (Just (38,26)-(38,31)) "depth") (Lit (Just (38,34)-(38,35)) (LI 1))]],App (Just (38,40)-(38,67)) (Var (Just (38,41)-(38,46)) "build") [Tuple (Just (38,47)-(38,66)) [Var (Just (38,48)-(38,52)) "rand",Bop (Just (38,54)-(38,65)) Minus (Var (Just (38,55)-(38,60)) "depth") (Lit (Just (38,63)-(38,64)) (LI 1))]],App (Just (39,12)-(39,39)) (Var (Just (39,13)-(39,18)) "build") [Tuple (Just (39,19)-(39,38)) [Var (Just (39,20)-(39,24)) "rand",Bop (Just (39,26)-(39,37)) Minus (Var (Just (39,27)-(39,32)) "depth") (Lit (Just (39,35)-(39,36)) (LI 1))]],App (Just (39,41)-(39,68)) (Var (Just (39,42)-(39,47)) "build") [Tuple (Just (39,48)-(39,67)) [Var (Just (39,49)-(39,53)) "rand",Bop (Just (39,55)-(39,66)) Minus (Var (Just (39,56)-(39,61)) "depth") (Lit (Just (39,64)-(39,65)) (LI 1))]]]])]
Case (Just (40,7)-(40,65)) (App (Just (40,14)-(40,25)) (Var (Just (40,14)-(40,18)) "rand") [Tuple (Just (40,19)-(40,25)) [Lit (Just (40,20)-(40,21)) (LI 0),Lit (Just (40,23)-(40,24)) (LI 1)]]) [(LitPat (Just (40,33)-(40,34)) (LI 0),Nothing,App (Just (40,38)-(40,47)) (Var (Just (40,38)-(40,44)) "buildX") [ConApp (Just (40,45)-(40,47)) "()" Nothing (Just (TApp "unit" []))]),(WildPat (Just (40,50)-(40,51)),Nothing,App (Just (40,55)-(40,64)) (Var (Just (40,55)-(40,61)) "buildY") [ConApp (Just (40,62)-(40,64)) "()" Nothing (Just (TApp "unit" []))])]
*)

(* typed spans
(17,17)-(17,67)
(19,16)-(19,39)
(21,11)-(21,20)
(23,11)-(23,20)
(28,4)-(39,69)
(40,7)-(40,65)
*)

(* correct types
(expr * expr * expr * expr) -> expr
(expr * expr) -> expr
unit -> expr
unit -> expr
expr
expr
*)

(* bad types
(int * int) -> unit
(int * int) -> unit
(int * int) -> unit
(int * int) -> unit
expr
unit
*)
