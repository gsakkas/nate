
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
  | 0 ->
      let temp = (rand (0, 1)) = 0 in if temp then buildX () else buildY ()
  | _ ->
      let y = rand (2, 6) in
      if y = 2
      then buildSine (build (rand, (depth - 1)))
      else
        if y = 3
        then buildCosine (build (rand, (depth - 1)))
        else
          if y = 4
          then
            buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if y = 5
            then
              buildTimes
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
            else
              if y = 6
              then
                buildThresh
                  ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                    (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


(* fix

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
  match depth with
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ -> buildX ();;

*)

(* changed spans
(28,6)-(28,75)
if rand (0 , 1) = 0
then buildX ()
else buildY ()
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(30,6)-(51,77)
buildX ()
AppG (fromList [ConAppG Nothing])

(30,6)-(51,77)
buildX
VarG

*)

(* changed exprs
Ite (Just (17,9)-(17,59)) (Bop (Just (17,12)-(17,29)) Eq (App (Just (17,12)-(17,25)) (Var (Just (17,13)-(17,17)) "rand") [Tuple (Just (17,18)-(17,24)) [Lit (Just (17,19)-(17,20)) (LI 0),Lit (Just (17,22)-(17,23)) (LI 1)]]) (Lit (Just (17,28)-(17,29)) (LI 0))) (App (Just (17,35)-(17,44)) (Var (Just (17,35)-(17,41)) "buildX") [ConApp (Just (17,42)-(17,44)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (17,50)-(17,59)) (Var (Just (17,50)-(17,56)) "buildY") [ConApp (Just (17,57)-(17,59)) "()" Nothing (Just (TApp "unit" []))])
App (Just (18,9)-(18,18)) (Var (Just (18,9)-(18,15)) "buildX") [ConApp (Just (18,16)-(18,18)) "()" Nothing (Just (TApp "unit" []))]
Var (Just (18,9)-(18,15)) "buildX"
*)

(* typed spans
(17,9)-(17,59)
(18,9)-(18,18)
(18,9)-(18,15)
*)

(* correct types
expr
expr
unit -> expr
*)

(* bad types
expr
unit
unit
*)
