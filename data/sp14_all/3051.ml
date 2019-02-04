
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
  if depth < 1
  then let base = rand 0 2 in match base with | 0 -> buildX | 1 -> buildY;;


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
  if depth < 1
  then
    let base = rand (0, 2) in
    match base with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | _ -> (if base < 0 then buildX () else buildY ())
  else
    (let recurse = rand (0, 5) in
     match recurse with
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
     | _ ->
         if recurse > 2
         then build (rand, (depth - 1))
         else build (rand, (depth - 1)));;

*)

(* changed spans
(11,11)-(11,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(17,18)-(17,26)
rand (0 , 2)
AppG (fromList [TupleG (fromList [EmptyG])])

(17,23)-(17,24)
(0 , 2)
TupleG (fromList [LitG])

(17,30)-(17,73)
match base with
| 0 -> buildX ()
| 1 -> buildY ()
| _ -> if base < 0
       then buildX ()
       else buildY ()
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,IteG EmptyG EmptyG EmptyG)])

(17,53)-(17,59)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(17,67)-(17,73)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

*)
