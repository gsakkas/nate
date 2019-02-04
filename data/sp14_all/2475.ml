
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
        then buildSine (buildhelper 0 (depth - 1))
        else buildCosine (buildhelper 0 (depth - 1))
    | 2 ->
        if (rand (0, 1)) = 0
        then
          buildAverage
            ((buildhelper (num - 1) (depth - 1) expr),
              (buildhelper (num - 1) (depth - 1) expr))
        else
          buildTimes
            ((buildhelper (num - 1) (depth - 1) expr),
              (buildhelper (num - 1) (depth - 1) expr))
    | 3 -> buildhelper (num - 1) depth expr
    | 4 ->
        buildThresh
          ((buildhelper (num - 2) (depth - 1) expr),
            (buildhelper (num - 2) (depth - 1) expr),
            (buildhelper (num - 2) (depth - 1) expr),
            (buildhelper (num - 2) (depth - 1) expr)) in
  buildhelper rand (1, 4) depth "";;


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
(27,4)-(49,53)
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

(31,23)-(31,50)
buildhelper 0 0 expr
AppG (fromList [VarG,LitG])

(31,38)-(31,49)
if rand (0 , 1) = 0
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
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(32,13)-(32,24)
EMPTY
EmptyG

(32,13)-(32,52)
buildhelper (depth - 1)
            (depth - 1) expr
AppG (fromList [VarG,BopG EmptyG EmptyG])

(32,25)-(32,52)
buildTimes
VarG

(32,26)-(32,37)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG (fromList [AppG (fromList [EmptyG])])

(32,38)-(32,39)
EMPTY
EmptyG

(34,8)-(42,55)
buildhelper (depth - 1)
            (depth - 1) expr
AppG (fromList [VarG,BopG EmptyG EmptyG])

(37,27)-(37,30)
depth
VarG

(38,28)-(38,31)
depth
VarG

(41,27)-(41,30)
depth
VarG

(42,28)-(42,31)
depth
VarG

(43,11)-(43,43)
buildThresh (buildhelper (depth - 1)
                         (depth - 1)
                         expr , buildhelper (depth - 1)
                                            (depth - 1)
                                            expr , buildhelper (depth - 1)
                                                               (depth - 1)
                                                               expr , buildhelper (depth - 1)
                                                                                  (depth - 1)
                                                                                  expr)
AppG (fromList [TupleG (fromList [EmptyG])])

(43,24)-(43,27)
depth
VarG

(43,33)-(43,38)
depth - 1
BopG VarG LitG

(43,39)-(43,43)
1
LitG

(45,8)-(49,53)
buildhelper (depth - 1)
            (depth - 1) expr
AppG (fromList [VarG,BopG EmptyG EmptyG])

(46,25)-(46,28)
EMPTY
EmptyG

(46,31)-(46,32)
depth
VarG

(46,34)-(46,45)
1
LitG

(47,26)-(47,29)
EMPTY
EmptyG

(47,32)-(47,33)
depth
VarG

(47,35)-(47,46)
1
LitG

(48,26)-(48,29)
EMPTY
EmptyG

(48,32)-(48,33)
depth
VarG

(48,35)-(48,46)
1
LitG

(49,26)-(49,29)
EMPTY
EmptyG

(49,32)-(49,33)
depth
VarG

(49,35)-(49,46)
1
LitG

(50,2)-(50,34)
buildhelper (rand (1 , 4))
            depth ""
AppG (fromList [VarG,AppG (fromList [EmptyG]),LitG])

(50,14)-(50,18)
rand (1 , 4)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
