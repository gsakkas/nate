
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match ((rand (243, 98723)), depth) with
  | (x,0) when (x mod 2) = 0 -> buildY ()
  | (x,0) when (x mod 2) = 1 -> buildX ()
  | (x,n) when (n mod 5) = 0 -> buildSine (build (x, (n - 1)))
  | (x,n) when (n mod 5) = 4 -> buildCosine (build (x, (n - 1)));;


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
  match ((rand (243, 98723)), depth) with
  | (x,0) when (x mod 2) = 0 -> buildY ()
  | (x,0) when (x mod 2) = 1 -> buildX ()
  | (x,n) when (n > 0) && ((x mod 5) = 0) ->
      buildSine (build (rand, (n - 1)))
  | (x,n) when (n > 0) && ((x mod 5) = 1) ->
      buildCosine (build (rand, (n - 1)))
  | (x,n) when (n > 0) && ((x mod 5) = 2) ->
      buildAverage ((build (rand, (n - 1))), (build (rand, (n - 1))))
  | (x,n) when (n > 0) && ((x mod 5) = 3) ->
      buildTimes ((build (rand, (n - 1))), (build (rand, (n - 1))))
  | (x,n) when (n > 0) && ((x mod 5) = 4) ->
      buildThresh
        ((build (rand, (n - 1))), (build (rand, (n - 1))),
          (build (rand, (n - 1))), (build (rand, (n - 1))));;

*)

(* changed spans
(11,16)-(11,28)
fun (e1 , e2) ->
  Average (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(15,11)-(15,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(20,2)-(24,64)
match (rand (243 , 98723) , depth) with
| (x , 0) when (x mod 2) = 0 -> buildY ()
| (x , 0) when (x mod 2) = 1 -> buildX ()
| (x , n) when (n > 0) && ((x mod 5) = 0) -> buildSine (build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 1) -> buildCosine (build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 2) -> buildAverage (build (rand , n - 1) , build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 3) -> buildTimes (build (rand , n - 1) , build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 4) -> buildThresh (build (rand , n - 1) , build (rand , n - 1) , build (rand , n - 1) , build (rand , n - 1))
CaseG (TupleG (fromList [EmptyG])) (fromList [(Just (BopG EmptyG EmptyG),AppG (fromList [EmptyG]))])

(22,32)-(22,38)
buildThresh (build (rand , n - 1) , build (rand , n - 1) , build (rand , n - 1) , build (rand , n - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(23,50)-(23,51)
rand
VarG

(24,52)-(24,53)
rand
VarG

*)
