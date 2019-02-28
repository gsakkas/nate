
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
  let r = rand (0, 11) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX () else buildY ()
  | d ->
      if r <= 2
      then buildSine (build (rand, (d - 1)))
      else
        if r <= 9
        then
          (match r with
           | 3 ->
               buildAverage
                 ((build (rand, (d - 1))), (build (rand, (d - 1))))
           | 4 ->
               buildTimes ((build (rand, (d - 1))), (build (rand, (d - 1))))
           | 5 ->
               buildThresh
                 ((build (rand, (d - 1))), (build (rand, (d - 1))),
                   (build (rand, (d - 1))), (build (rand, (d - 1))))
           | 6 -> 0.
           | 7 -> 0.)
        else buildCosine (build (rand, (d - 1)));;


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
  let r = rand (0, 11) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX () else buildY ()
  | d ->
      if r <= 2
      then buildSine (build (rand, (d - 1)))
      else
        if r <= 9
        then
          (match r with
           | 3 ->
               buildAverage
                 ((build (rand, (d - 1))), (build (rand, (d - 1))))
           | 4 ->
               buildTimes ((build (rand, (d - 1))), (build (rand, (d - 1))))
           | 5 ->
               buildThresh
                 ((build (rand, (d - 1))), (build (rand, (d - 1))),
                   (build (rand, (d - 1))), (build (rand, (d - 1)))))
        else buildCosine (build (rand, (d - 1)));;

*)

(* changed spans
(35,10)-(46,21)
match r with
| 3 -> buildAverage (build (rand , d - 1) , build (rand , d - 1))
| 4 -> buildTimes (build (rand , d - 1) , build (rand , d - 1))
| 5 -> buildThresh (build (rand , d - 1) , build (rand , d - 1) , build (rand , d - 1) , build (rand , d - 1))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (35,10)-(44,69)) (Var (Just (35,17)-(35,18)) "r") [(LitPat (Just (36,13)-(36,14)) (LI 3),Nothing,App (Just (37,15)-(38,67)) (Var (Just (37,15)-(37,27)) "buildAverage") [Tuple (Just (38,17)-(38,67)) [App (Just (38,18)-(38,41)) (Var (Just (38,19)-(38,24)) "build") [Tuple (Just (38,25)-(38,40)) [Var (Just (38,26)-(38,30)) "rand",Bop (Just (38,32)-(38,39)) Minus (Var (Just (38,33)-(38,34)) "d") (Lit (Just (38,37)-(38,38)) (LI 1))]],App (Just (38,43)-(38,66)) (Var (Just (38,44)-(38,49)) "build") [Tuple (Just (38,50)-(38,65)) [Var (Just (38,51)-(38,55)) "rand",Bop (Just (38,57)-(38,64)) Minus (Var (Just (38,58)-(38,59)) "d") (Lit (Just (38,62)-(38,63)) (LI 1))]]]]),(LitPat (Just (39,13)-(39,14)) (LI 4),Nothing,App (Just (40,15)-(40,76)) (Var (Just (40,15)-(40,25)) "buildTimes") [Tuple (Just (40,26)-(40,76)) [App (Just (40,27)-(40,50)) (Var (Just (40,28)-(40,33)) "build") [Tuple (Just (40,34)-(40,49)) [Var (Just (40,35)-(40,39)) "rand",Bop (Just (40,41)-(40,48)) Minus (Var (Just (40,42)-(40,43)) "d") (Lit (Just (40,46)-(40,47)) (LI 1))]],App (Just (40,52)-(40,75)) (Var (Just (40,53)-(40,58)) "build") [Tuple (Just (40,59)-(40,74)) [Var (Just (40,60)-(40,64)) "rand",Bop (Just (40,66)-(40,73)) Minus (Var (Just (40,67)-(40,68)) "d") (Lit (Just (40,71)-(40,72)) (LI 1))]]]]),(LitPat (Just (41,13)-(41,14)) (LI 5),Nothing,App (Just (42,15)-(44,68)) (Var (Just (42,15)-(42,26)) "buildThresh") [Tuple (Just (43,17)-(44,68)) [App (Just (43,18)-(43,41)) (Var (Just (43,19)-(43,24)) "build") [Tuple (Just (43,25)-(43,40)) [Var (Just (43,26)-(43,30)) "rand",Bop (Just (43,32)-(43,39)) Minus (Var (Just (43,33)-(43,34)) "d") (Lit (Just (43,37)-(43,38)) (LI 1))]],App (Just (43,43)-(43,66)) (Var (Just (43,44)-(43,49)) "build") [Tuple (Just (43,50)-(43,65)) [Var (Just (43,51)-(43,55)) "rand",Bop (Just (43,57)-(43,64)) Minus (Var (Just (43,58)-(43,59)) "d") (Lit (Just (43,62)-(43,63)) (LI 1))]],App (Just (44,19)-(44,42)) (Var (Just (44,20)-(44,25)) "build") [Tuple (Just (44,26)-(44,41)) [Var (Just (44,27)-(44,31)) "rand",Bop (Just (44,33)-(44,40)) Minus (Var (Just (44,34)-(44,35)) "d") (Lit (Just (44,38)-(44,39)) (LI 1))]],App (Just (44,44)-(44,67)) (Var (Just (44,45)-(44,50)) "build") [Tuple (Just (44,51)-(44,66)) [Var (Just (44,52)-(44,56)) "rand",Bop (Just (44,58)-(44,65)) Minus (Var (Just (44,59)-(44,60)) "d") (Lit (Just (44,63)-(44,64)) (LI 1))]]]])]
*)

(* typed spans
(35,10)-(44,69)
*)

(* correct types
expr
*)

(* bad types
expr
*)
