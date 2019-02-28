
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Exponential of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildExponential (e1,e2) = Exponential (e1, e2);;

let buildSine e = Sine e;;

let buildSquare e = Square e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (1, 7) in
  let d = depth - 1 in
  if d != 0
  then
    match r with
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildCosine (build (rand, d))
    | 3 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 4 -> buildTimes ((build (rand, d)), (build (rand, d)))
    | 5 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
    | 6 -> buildSquare ((build (rand, d)), (build (rand, d)))
    | _ -> buildExponential ((build (rand, d)), (build (rand, d)))
  else
    (let rr = rand (1, 8) in
     match rr with | 6 -> buildX () | 8 -> buildY () | _ -> buildX ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Exponential of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildExponential (e1,e2) = Exponential (e1, e2);;

let buildSine e = Sine e;;

let buildSquare e = Square e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (1, 7) in
  let d = depth - 1 in
  if d != 0
  then
    match r with
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildCosine (build (rand, d))
    | 3 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 4 -> buildTimes ((build (rand, d)), (build (rand, d)))
    | 5 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
    | 6 -> buildSquare (build (rand, d))
    | _ -> buildExponential ((build (rand, d)), (build (rand, d)))
  else
    (let rr = rand (1, 8) in
     match rr with | 6 -> buildX () | 8 -> buildY () | _ -> buildX ());;

*)

(* changed spans
(45,23)-(45,61)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(45,23)-(45,61)
buildExponential (build (rand , d) , build (rand , d))
AppG (fromList [TupleG (fromList [EmptyG])])

(46,11)-(46,66)
buildExponential
VarG

(46,11)-(46,66)
(build (rand , d) , build (rand , d))
TupleG (fromList [AppG (fromList [EmptyG])])

(46,11)-(46,66)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(46,11)-(46,66)
build
VarG

(46,11)-(46,66)
(rand , d)
TupleG (fromList [VarG])

(46,11)-(46,66)
rand
VarG

(46,11)-(46,66)
d
VarG

(46,11)-(46,66)
build (rand , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(46,11)-(46,66)
build
VarG

(46,11)-(46,66)
(rand , d)
TupleG (fromList [VarG])

(46,11)-(46,66)
rand
VarG

(46,11)-(46,66)
d
VarG

*)

(* changed exprs
App (Just (45,23)-(45,40)) (Var (Just (45,24)-(45,29)) "build") [Tuple (Just (45,30)-(45,39)) [Var (Just (45,31)-(45,35)) "rand",Var (Just (45,37)-(45,38)) "d"]]
App (Just (46,11)-(46,66)) (Var (Just (46,11)-(46,27)) "buildExponential") [Tuple (Just (46,28)-(46,66)) [App (Just (46,29)-(46,46)) (Var (Just (46,30)-(46,35)) "build") [Tuple (Just (46,36)-(46,45)) [Var (Just (46,37)-(46,41)) "rand",Var (Just (46,43)-(46,44)) "d"]],App (Just (46,48)-(46,65)) (Var (Just (46,49)-(46,54)) "build") [Tuple (Just (46,55)-(46,64)) [Var (Just (46,56)-(46,60)) "rand",Var (Just (46,62)-(46,63)) "d"]]]]
Var (Just (46,11)-(46,27)) "buildExponential"
Tuple (Just (46,28)-(46,66)) [App (Just (46,29)-(46,46)) (Var (Just (46,30)-(46,35)) "build") [Tuple (Just (46,36)-(46,45)) [Var (Just (46,37)-(46,41)) "rand",Var (Just (46,43)-(46,44)) "d"]],App (Just (46,48)-(46,65)) (Var (Just (46,49)-(46,54)) "build") [Tuple (Just (46,55)-(46,64)) [Var (Just (46,56)-(46,60)) "rand",Var (Just (46,62)-(46,63)) "d"]]]
App (Just (46,29)-(46,46)) (Var (Just (46,30)-(46,35)) "build") [Tuple (Just (46,36)-(46,45)) [Var (Just (46,37)-(46,41)) "rand",Var (Just (46,43)-(46,44)) "d"]]
Var (Just (46,30)-(46,35)) "build"
Tuple (Just (46,36)-(46,45)) [Var (Just (46,37)-(46,41)) "rand",Var (Just (46,43)-(46,44)) "d"]
Var (Just (46,37)-(46,41)) "rand"
Var (Just (46,43)-(46,44)) "d"
App (Just (46,48)-(46,65)) (Var (Just (46,49)-(46,54)) "build") [Tuple (Just (46,55)-(46,64)) [Var (Just (46,56)-(46,60)) "rand",Var (Just (46,62)-(46,63)) "d"]]
Var (Just (46,49)-(46,54)) "build"
Tuple (Just (46,55)-(46,64)) [Var (Just (46,56)-(46,60)) "rand",Var (Just (46,62)-(46,63)) "d"]
Var (Just (46,56)-(46,60)) "rand"
Var (Just (46,62)-(46,63)) "d"
*)

(* typed spans
(45,23)-(45,40)
(46,11)-(46,66)
(46,11)-(46,27)
(46,28)-(46,66)
(46,29)-(46,46)
(46,30)-(46,35)
(46,36)-(46,45)
(46,37)-(46,41)
(46,43)-(46,44)
(46,48)-(46,65)
(46,49)-(46,54)
(46,55)-(46,64)
(46,56)-(46,60)
(46,62)-(46,63)
*)

(* correct types
expr
expr
(expr * expr) -> expr
(expr * expr)
expr
((int * int) -> int * int) -> expr
((int * int) -> int * int)
(int * int) -> int
int
expr
((int * int) -> int * int) -> expr
((int * int) -> int * int)
(int * int) -> int
int
*)

(* bad types
(expr * expr)
(expr * expr)
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
expr
*)
