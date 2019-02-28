
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cotangent of expr
  | Volume of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildCotanget e = Cotangent e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildVolume (l,w,h) = Volume (l, w, h);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let random = rand (0, 1) in (if random = 0 then buildX () else buildY ())
  else
    (let random = rand (0, 6) in
     match random with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 -> buildCotanget (rand, (depth - 1))
     | 6 -> buildVolume (rand, (depth - 1)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cotangent of expr
  | Volume of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildCotangent e = Cotangent e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildVolume (l,w,h) = Volume (l, w, h);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let random = rand (0, 1) in (if random = 0 then buildX () else buildY ())
  else
    (let random = rand (0, 4) in
     match random with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 -> buildCotangent (build (rand, (depth - 1)))
     | 6 ->
         buildVolume
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;

*)

(* changed spans
(36,27)-(36,28)
4
LitG

(50,12)-(50,25)
buildCotangent
VarG

(50,26)-(50,45)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(51,24)-(51,43)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lit (Just (36,27)-(36,28)) (LI 4)
Var (Just (50,12)-(50,26)) "buildCotangent"
App (Just (50,27)-(50,54)) (Var (Just (50,28)-(50,33)) "build") [Tuple (Just (50,34)-(50,53)) [Var (Just (50,35)-(50,39)) "rand",Bop (Just (50,41)-(50,52)) Minus (Var (Just (50,42)-(50,47)) "depth") (Lit (Just (50,50)-(50,51)) (LI 1))]]
Tuple (Just (53,11)-(54,41)) [App (Just (53,12)-(53,39)) (Var (Just (53,13)-(53,18)) "build") [Tuple (Just (53,19)-(53,38)) [Var (Just (53,20)-(53,24)) "rand",Bop (Just (53,26)-(53,37)) Minus (Var (Just (53,27)-(53,32)) "depth") (Lit (Just (53,35)-(53,36)) (LI 1))]],App (Just (53,41)-(53,68)) (Var (Just (53,42)-(53,47)) "build") [Tuple (Just (53,48)-(53,67)) [Var (Just (53,49)-(53,53)) "rand",Bop (Just (53,55)-(53,66)) Minus (Var (Just (53,56)-(53,61)) "depth") (Lit (Just (53,64)-(53,65)) (LI 1))]],App (Just (54,13)-(54,40)) (Var (Just (54,14)-(54,19)) "build") [Tuple (Just (54,20)-(54,39)) [Var (Just (54,21)-(54,25)) "rand",Bop (Just (54,27)-(54,38)) Minus (Var (Just (54,28)-(54,33)) "depth") (Lit (Just (54,36)-(54,37)) (LI 1))]]]
*)

(* typed spans
(36,27)-(36,28)
(50,12)-(50,26)
(50,27)-(50,54)
(53,11)-(54,41)
*)

(* correct types
int
expr -> expr
expr
(expr * expr * expr)
*)

(* bad types
int
expr -> expr
((int * int) -> int * int)
((int * int) -> int * int)
*)
