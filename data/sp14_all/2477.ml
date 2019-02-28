
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
    | 1 ->
        if (rand (0, 1)) = 0
        then buildCosine (buildhelper 0 (depth - 1) expr)
        else expr ^ ("Cosine(" ^ ((buildhelper 0 (depth - 1) expr) ^ ")"))
    | 2 ->
        if (rand (0, 1)) = 0
        then
          expr ^
            ("((" ^
               ((buildhelper (num - 1) (depth - 1) expr) ^
                  ("+" ^ ((buildhelper (num - 1) (depth - 1) expr) ^ ")/2)"))))
        else
          expr ^
            ((buildhelper (num - 1) (depth - 1) expr) ^
               ("*" ^ (buildhelper (num - 1) (depth - 1) expr)))
    | 3 -> expr ^ (buildhelper (num - 1) depth expr)
    | 4 ->
        expr ^
          ("(" ^
             ((buildhelper (num - 2) (depth - 1) expr) ^
                ("<" ^
                   ((buildhelper (num - 2) (depth - 1) expr) ^
                      ("?" ^
                         ((buildhelper (num - 2) (depth - 1) expr) ^
                            (":" ^
                               ((buildhelper (num - 2) (depth - 1) expr) ^
                                  ")")))))))) in
  let num = rand (1, 4) in buildhelper num depth "";;


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
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
    | 1 ->
        if (rand (0, 1)) = 0
        then buildSine (buildhelper 0 0 expr)
        else buildCosine (buildhelper 0 0 expr)
    | 2 ->
        if (rand (0, 1)) = 0
        then
          buildAverage
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
        else
          buildTimes
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
    | 3 ->
        if (rand (0, 1)) = 0
        then
          buildAverage
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
        else
          buildTimes
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
    | 4 ->
        buildThresh
          ((buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr))
    | _ ->
        buildThresh
          ((buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr)) in
  buildhelper (rand (1, 4)) depth "";;

*)

(* changed spans
(11,16)-(11,28)
fun (e1 , e2) ->
  Average (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(13,11)-(13,20)
fun e -> Sine e
LamG (ConAppG (Just VarG))

(13,11)-(13,20)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(13,11)-(13,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(19,4)-(47,45)
match num with
| 0 -> if rand (0 , 1) = 0
       then buildX ()
       else buildY ()
| 1 -> if rand (0 , 1) = 0
       then buildSine (buildhelper 0
                                   0 expr)
       else buildCosine (buildhelper 0
                                     0 expr)
| 2 -> if rand (0 , 1) = 0
       then buildAverage (buildhelper (depth - 1)
                                      (depth - 1)
                                      expr , buildhelper (depth - 1)
                                                         (depth - 1)
                                                         expr)
       else buildTimes (buildhelper (depth - 1)
                                    (depth - 1)
                                    expr , buildhelper (depth - 1)
                                                       (depth - 1)
                                                       expr)
| 3 -> if rand (0 , 1) = 0
       then buildAverage (buildhelper (depth - 1)
                                      (depth - 1)
                                      expr , buildhelper (depth - 1)
                                                         (depth - 1)
                                                         expr)
       else buildTimes (buildhelper (depth - 1)
                                    (depth - 1)
                                    expr , buildhelper (depth - 1)
                                                       (depth - 1)
                                                       expr)
| 4 -> buildThresh (buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr , buildhelper (depth - 1)
                                                                                         (depth - 1)
                                                                                         expr)
| _ -> buildThresh (buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr , buildhelper (depth - 1)
                                                                                         (depth - 1)
                                                                                         expr)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,IteG EmptyG EmptyG EmptyG)])

(48,2)-(48,51)
buildhelper (rand (1 , 4))
            depth ""
AppG (fromList [VarG,AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Lam (Just (11,18)-(11,43)) (TuplePat (Just (11,18)-(11,23)) [VarPat (Just (11,18)-(11,20)) "e1",VarPat (Just (11,21)-(11,23)) "e2"]) (ConApp (Just (11,27)-(11,43)) "Average" (Just (Tuple (Just (11,35)-(11,43)) [Var (Just (11,36)-(11,38)) "e1",Var (Just (11,40)-(11,42)) "e2"])) Nothing) Nothing
Lam (Just (15,14)-(15,24)) (VarPat (Just (15,14)-(15,15)) "e") (ConApp (Just (15,18)-(15,24)) "Sine" (Just (Var (Just (15,23)-(15,24)) "e")) Nothing) Nothing
Lam (Just (17,17)-(17,67)) (TuplePat (Just (17,17)-(17,34)) [VarPat (Just (17,17)-(17,18)) "a",VarPat (Just (17,19)-(17,20)) "b",VarPat (Just (17,21)-(17,27)) "a_less",VarPat (Just (17,28)-(17,34)) "b_less"]) (ConApp (Just (17,38)-(17,67)) "Thresh" (Just (Tuple (Just (17,45)-(17,67)) [Var (Just (17,46)-(17,47)) "a",Var (Just (17,49)-(17,50)) "b",Var (Just (17,52)-(17,58)) "a_less",Var (Just (17,60)-(17,66)) "b_less"])) Nothing) Nothing
Lam (Just (19,16)-(19,39)) (TuplePat (Just (19,16)-(19,21)) [VarPat (Just (19,16)-(19,18)) "e1",VarPat (Just (19,19)-(19,21)) "e2"]) (ConApp (Just (19,25)-(19,39)) "Times" (Just (Tuple (Just (19,31)-(19,39)) [Var (Just (19,32)-(19,34)) "e1",Var (Just (19,36)-(19,38)) "e2"])) Nothing) Nothing
Case (Just (27,4)-(64,55)) (Var (Just (27,10)-(27,13)) "num") [(LitPat (Just (28,6)-(28,7)) (LI 0),Nothing,Ite (Just (28,11)-(28,61)) (Bop (Just (28,14)-(28,31)) Eq (App (Just (28,14)-(28,27)) (Var (Just (28,15)-(28,19)) "rand") [Tuple (Just (28,20)-(28,26)) [Lit (Just (28,21)-(28,22)) (LI 0),Lit (Just (28,24)-(28,25)) (LI 1)]]) (Lit (Just (28,30)-(28,31)) (LI 0))) (App (Just (28,37)-(28,46)) (Var (Just (28,37)-(28,43)) "buildX") [ConApp (Just (28,44)-(28,46)) "()" Nothing (Just (TApp "unit" []))]) (App (Just (28,52)-(28,61)) (Var (Just (28,52)-(28,58)) "buildY") [ConApp (Just (28,59)-(28,61)) "()" Nothing (Just (TApp "unit" []))])),(LitPat (Just (29,6)-(29,7)) (LI 1),Nothing,Ite (Just (30,8)-(32,47)) (Bop (Just (30,11)-(30,28)) Eq (App (Just (30,11)-(30,24)) (Var (Just (30,12)-(30,16)) "rand") [Tuple (Just (30,17)-(30,23)) [Lit (Just (30,18)-(30,19)) (LI 0),Lit (Just (30,21)-(30,22)) (LI 1)]]) (Lit (Just (30,27)-(30,28)) (LI 0))) (App (Just (31,13)-(31,45)) (Var (Just (31,13)-(31,22)) "buildSine") [App (Just (31,23)-(31,45)) (Var (Just (31,24)-(31,35)) "buildhelper") [Lit (Just (31,36)-(31,37)) (LI 0),Lit (Just (31,38)-(31,39)) (LI 0),Var (Just (31,40)-(31,44)) "expr"]]) (App (Just (32,13)-(32,47)) (Var (Just (32,13)-(32,24)) "buildCosine") [App (Just (32,25)-(32,47)) (Var (Just (32,26)-(32,37)) "buildhelper") [Lit (Just (32,38)-(32,39)) (LI 0),Lit (Just (32,40)-(32,41)) (LI 0),Var (Just (32,42)-(32,46)) "expr"]])),(LitPat (Just (33,6)-(33,7)) (LI 2),Nothing,Ite (Just (34,8)-(42,57)) (Bop (Just (34,11)-(34,28)) Eq (App (Just (34,11)-(34,24)) (Var (Just (34,12)-(34,16)) "rand") [Tuple (Just (34,17)-(34,23)) [Lit (Just (34,18)-(34,19)) (LI 0),Lit (Just (34,21)-(34,22)) (LI 1)]]) (Lit (Just (34,27)-(34,28)) (LI 0))) (App (Just (36,10)-(38,57)) (Var (Just (36,10)-(36,22)) "buildAverage") [Tuple (Just (37,12)-(38,57)) [App (Just (37,13)-(37,55)) (Var (Just (37,14)-(37,25)) "buildhelper") [Bop (Just (37,26)-(37,37)) Minus (Var (Just (37,27)-(37,32)) "depth") (Lit (Just (37,35)-(37,36)) (LI 1)),Bop (Just (37,38)-(37,49)) Minus (Var (Just (37,39)-(37,44)) "depth") (Lit (Just (37,47)-(37,48)) (LI 1)),Var (Just (37,50)-(37,54)) "expr"],App (Just (38,14)-(38,56)) (Var (Just (38,15)-(38,26)) "buildhelper") [Bop (Just (38,27)-(38,38)) Minus (Var (Just (38,28)-(38,33)) "depth") (Lit (Just (38,36)-(38,37)) (LI 1)),Bop (Just (38,39)-(38,50)) Minus (Var (Just (38,40)-(38,45)) "depth") (Lit (Just (38,48)-(38,49)) (LI 1)),Var (Just (38,51)-(38,55)) "expr"]]]) (App (Just (40,10)-(42,57)) (Var (Just (40,10)-(40,20)) "buildTimes") [Tuple (Just (41,12)-(42,57)) [App (Just (41,13)-(41,55)) (Var (Just (41,14)-(41,25)) "buildhelper") [Bop (Just (41,26)-(41,37)) Minus (Var (Just (41,27)-(41,32)) "depth") (Lit (Just (41,35)-(41,36)) (LI 1)),Bop (Just (41,38)-(41,49)) Minus (Var (Just (41,39)-(41,44)) "depth") (Lit (Just (41,47)-(41,48)) (LI 1)),Var (Just (41,50)-(41,54)) "expr"],App (Just (42,14)-(42,56)) (Var (Just (42,15)-(42,26)) "buildhelper") [Bop (Just (42,27)-(42,38)) Minus (Var (Just (42,28)-(42,33)) "depth") (Lit (Just (42,36)-(42,37)) (LI 1)),Bop (Just (42,39)-(42,50)) Minus (Var (Just (42,40)-(42,45)) "depth") (Lit (Just (42,48)-(42,49)) (LI 1)),Var (Just (42,51)-(42,55)) "expr"]]])),(LitPat (Just (43,6)-(43,7)) (LI 3),Nothing,Ite (Just (44,8)-(52,57)) (Bop (Just (44,11)-(44,28)) Eq (App (Just (44,11)-(44,24)) (Var (Just (44,12)-(44,16)) "rand") [Tuple (Just (44,17)-(44,23)) [Lit (Just (44,18)-(44,19)) (LI 0),Lit (Just (44,21)-(44,22)) (LI 1)]]) (Lit (Just (44,27)-(44,28)) (LI 0))) (App (Just (46,10)-(48,57)) (Var (Just (46,10)-(46,22)) "buildAverage") [Tuple (Just (47,12)-(48,57)) [App (Just (47,13)-(47,55)) (Var (Just (47,14)-(47,25)) "buildhelper") [Bop (Just (47,26)-(47,37)) Minus (Var (Just (47,27)-(47,32)) "depth") (Lit (Just (47,35)-(47,36)) (LI 1)),Bop (Just (47,38)-(47,49)) Minus (Var (Just (47,39)-(47,44)) "depth") (Lit (Just (47,47)-(47,48)) (LI 1)),Var (Just (47,50)-(47,54)) "expr"],App (Just (48,14)-(48,56)) (Var (Just (48,15)-(48,26)) "buildhelper") [Bop (Just (48,27)-(48,38)) Minus (Var (Just (48,28)-(48,33)) "depth") (Lit (Just (48,36)-(48,37)) (LI 1)),Bop (Just (48,39)-(48,50)) Minus (Var (Just (48,40)-(48,45)) "depth") (Lit (Just (48,48)-(48,49)) (LI 1)),Var (Just (48,51)-(48,55)) "expr"]]]) (App (Just (50,10)-(52,57)) (Var (Just (50,10)-(50,20)) "buildTimes") [Tuple (Just (51,12)-(52,57)) [App (Just (51,13)-(51,55)) (Var (Just (51,14)-(51,25)) "buildhelper") [Bop (Just (51,26)-(51,37)) Minus (Var (Just (51,27)-(51,32)) "depth") (Lit (Just (51,35)-(51,36)) (LI 1)),Bop (Just (51,38)-(51,49)) Minus (Var (Just (51,39)-(51,44)) "depth") (Lit (Just (51,47)-(51,48)) (LI 1)),Var (Just (51,50)-(51,54)) "expr"],App (Just (52,14)-(52,56)) (Var (Just (52,15)-(52,26)) "buildhelper") [Bop (Just (52,27)-(52,38)) Minus (Var (Just (52,28)-(52,33)) "depth") (Lit (Just (52,36)-(52,37)) (LI 1)),Bop (Just (52,39)-(52,50)) Minus (Var (Just (52,40)-(52,45)) "depth") (Lit (Just (52,48)-(52,49)) (LI 1)),Var (Just (52,51)-(52,55)) "expr"]]])),(LitPat (Just (53,6)-(53,7)) (LI 4),Nothing,App (Just (54,8)-(58,55)) (Var (Just (54,8)-(54,19)) "buildThresh") [Tuple (Just (55,10)-(58,55)) [App (Just (55,11)-(55,53)) (Var (Just (55,12)-(55,23)) "buildhelper") [Bop (Just (55,24)-(55,35)) Minus (Var (Just (55,25)-(55,30)) "depth") (Lit (Just (55,33)-(55,34)) (LI 1)),Bop (Just (55,36)-(55,47)) Minus (Var (Just (55,37)-(55,42)) "depth") (Lit (Just (55,45)-(55,46)) (LI 1)),Var (Just (55,48)-(55,52)) "expr"],App (Just (56,12)-(56,54)) (Var (Just (56,13)-(56,24)) "buildhelper") [Bop (Just (56,25)-(56,36)) Minus (Var (Just (56,26)-(56,31)) "depth") (Lit (Just (56,34)-(56,35)) (LI 1)),Bop (Just (56,37)-(56,48)) Minus (Var (Just (56,38)-(56,43)) "depth") (Lit (Just (56,46)-(56,47)) (LI 1)),Var (Just (56,49)-(56,53)) "expr"],App (Just (57,12)-(57,54)) (Var (Just (57,13)-(57,24)) "buildhelper") [Bop (Just (57,25)-(57,36)) Minus (Var (Just (57,26)-(57,31)) "depth") (Lit (Just (57,34)-(57,35)) (LI 1)),Bop (Just (57,37)-(57,48)) Minus (Var (Just (57,38)-(57,43)) "depth") (Lit (Just (57,46)-(57,47)) (LI 1)),Var (Just (57,49)-(57,53)) "expr"],App (Just (58,12)-(58,54)) (Var (Just (58,13)-(58,24)) "buildhelper") [Bop (Just (58,25)-(58,36)) Minus (Var (Just (58,26)-(58,31)) "depth") (Lit (Just (58,34)-(58,35)) (LI 1)),Bop (Just (58,37)-(58,48)) Minus (Var (Just (58,38)-(58,43)) "depth") (Lit (Just (58,46)-(58,47)) (LI 1)),Var (Just (58,49)-(58,53)) "expr"]]]),(WildPat (Just (59,6)-(59,7)),Nothing,App (Just (60,8)-(64,55)) (Var (Just (60,8)-(60,19)) "buildThresh") [Tuple (Just (61,10)-(64,55)) [App (Just (61,11)-(61,53)) (Var (Just (61,12)-(61,23)) "buildhelper") [Bop (Just (61,24)-(61,35)) Minus (Var (Just (61,25)-(61,30)) "depth") (Lit (Just (61,33)-(61,34)) (LI 1)),Bop (Just (61,36)-(61,47)) Minus (Var (Just (61,37)-(61,42)) "depth") (Lit (Just (61,45)-(61,46)) (LI 1)),Var (Just (61,48)-(61,52)) "expr"],App (Just (62,12)-(62,54)) (Var (Just (62,13)-(62,24)) "buildhelper") [Bop (Just (62,25)-(62,36)) Minus (Var (Just (62,26)-(62,31)) "depth") (Lit (Just (62,34)-(62,35)) (LI 1)),Bop (Just (62,37)-(62,48)) Minus (Var (Just (62,38)-(62,43)) "depth") (Lit (Just (62,46)-(62,47)) (LI 1)),Var (Just (62,49)-(62,53)) "expr"],App (Just (63,12)-(63,54)) (Var (Just (63,13)-(63,24)) "buildhelper") [Bop (Just (63,25)-(63,36)) Minus (Var (Just (63,26)-(63,31)) "depth") (Lit (Just (63,34)-(63,35)) (LI 1)),Bop (Just (63,37)-(63,48)) Minus (Var (Just (63,38)-(63,43)) "depth") (Lit (Just (63,46)-(63,47)) (LI 1)),Var (Just (63,49)-(63,53)) "expr"],App (Just (64,12)-(64,54)) (Var (Just (64,13)-(64,24)) "buildhelper") [Bop (Just (64,25)-(64,36)) Minus (Var (Just (64,26)-(64,31)) "depth") (Lit (Just (64,34)-(64,35)) (LI 1)),Bop (Just (64,37)-(64,48)) Minus (Var (Just (64,38)-(64,43)) "depth") (Lit (Just (64,46)-(64,47)) (LI 1)),Var (Just (64,49)-(64,53)) "expr"]]])]
App (Just (65,2)-(65,36)) (Var (Just (65,2)-(65,13)) "buildhelper") [App (Just (65,14)-(65,27)) (Var (Just (65,15)-(65,19)) "rand") [Tuple (Just (65,20)-(65,26)) [Lit (Just (65,21)-(65,22)) (LI 1),Lit (Just (65,24)-(65,25)) (LI 4)]],Var (Just (65,28)-(65,33)) "depth",Lit (Just (65,34)-(65,36)) (LS "")]
*)

(* typed spans
(11,18)-(11,43)
(15,14)-(15,24)
(17,17)-(17,67)
(19,16)-(19,39)
(27,4)-(64,55)
(65,2)-(65,36)
*)

(* correct types
(expr * expr) -> expr
expr -> expr
(expr * expr * expr * expr) -> expr
(expr * expr) -> expr
expr
expr
*)

(* bad types
expr -> expr
unit -> expr
unit -> expr
unit -> expr
expr
expr
*)
