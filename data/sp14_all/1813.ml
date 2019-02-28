
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | AbsThresh of expr* expr* expr
  | ModThresh of expr* expr* expr;;

let buildAbsThresh (e1,e2,e3) = AbsThresh (e1, e2, e3);;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildModThresh (e1,e2,e3) = ModThresh (e1, e2, e3);;

let buildSine e = Sine e;;

let buildThresh (e1,e2,e3,e4) = Thresh (e1, e2, e3, e4);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0, 99) in
  if depth = 0
  then (if r < 50 then buildX else buildY)
  else
    if r < 5
    then buildX ()
    else
      if r < 10
      then buildY ()
      else
        if r < 30
        then buildSine (build (rand, (depth - 1)))
        else
          if r < 50
          then buildCosine (build (rand, (depth - 1)))
          else
            if r < 60
            then
              buildAverage
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
            else
              if r < 70
              then
                buildTimes
                  ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
              else
                if r < 80
                then
                  buildThresh
                    ((build (rand, (depth - 1))),
                      (build (rand, (depth - 1))),
                      (build (rand, (depth - 1))),
                      (build (rand, (depth - 1))))
                else
                  if r < 90
                  then
                    buildAbsThresh
                      ((build (rand, (depth - 1))),
                        (build (rand, (depth - 1))),
                        (build (rand, (depth - 1))))
                  else
                    if r < 90
                    then
                      buildModThresh
                        ((build (rand, (depth - 1))),
                          (build (rand, (depth - 1))),
                          (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | AbsThresh of expr* expr* expr
  | ModThresh of expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0, 99) in
  if depth = 0 then (if r < 50 then buildX () else buildY ()) else buildY ();;

*)

(* changed spans
(36,4)-(78,54)
buildX ()
AppG (fromList [ConAppG Nothing])

(36,4)-(78,54)
buildY ()
AppG (fromList [ConAppG Nothing])

(36,4)-(78,54)
buildY
VarG

(36,4)-(78,54)
()
ConAppG Nothing

(36,4)-(78,54)
buildY ()
AppG (fromList [ConAppG Nothing])

(36,4)-(78,54)
buildY
VarG

*)

(* changed exprs
App (Just (19,36)-(19,45)) (Var (Just (19,36)-(19,42)) "buildX") [ConApp (Just (19,43)-(19,45)) "()" Nothing (Just (TApp "unit" []))]
App (Just (19,51)-(19,60)) (Var (Just (19,51)-(19,57)) "buildY") [ConApp (Just (19,58)-(19,60)) "()" Nothing (Just (TApp "unit" []))]
Var (Just (19,51)-(19,57)) "buildY"
ConApp (Just (19,58)-(19,60)) "()" Nothing (Just (TApp "unit" []))
App (Just (19,67)-(19,76)) (Var (Just (19,67)-(19,73)) "buildY") [ConApp (Just (19,74)-(19,76)) "()" Nothing (Just (TApp "unit" []))]
Var (Just (19,67)-(19,73)) "buildY"
*)

(* typed spans
(19,36)-(19,45)
(19,51)-(19,60)
(19,51)-(19,57)
(19,58)-(19,60)
(19,67)-(19,76)
(19,67)-(19,73)
*)

(* correct types
expr
expr
unit -> expr
unit
expr
unit -> expr
*)

(* bad types
unit
unit
unit
unit
unit
unit
*)
