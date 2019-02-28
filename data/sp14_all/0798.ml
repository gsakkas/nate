
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildGauss (e1,e2,e3) = Gauss (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSqrt e = Sqrt (Abs e);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 ->
      (match rand (1, 2) with
       | 1 -> buildX
       | 2 -> buildY
       | _ ->
           let next = build (rand, (depth - 1)) in
           (match rand (1, 7) with
            | 1 -> buildSine next
            | 2 -> buildCosine next
            | 3 -> buildAverage (next, next)
            | 4 -> buildTimes (next, next)
            | 5 -> buildThresh (next, next, next, next)
            | 6 -> buildSqrt next
            | 7 -> buildGauss (next, next, next)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildGauss (e1,e2,e3) = Gauss (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSqrt e = Sqrt (Abs e);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (1, 2) with | 1 -> VarX | 2 -> VarY)
  | _ ->
      let next = build (rand, (depth - 1)) in
      (match rand (1, 7) with
       | 1 -> buildSine next
       | 2 -> buildCosine next
       | 3 -> buildAverage (next, next)
       | 4 -> buildTimes (next, next)
       | 5 -> buildThresh (next, next, next, next)
       | 6 -> buildSqrt next
       | 7 -> buildGauss (next, next, next));;

*)

(* changed spans
(33,2)-(47,50)
match depth with
| 0 -> match rand (1 , 2) with
       | 1 -> VarX
       | 2 -> VarY
| _ -> (let next =
          build (rand , depth - 1) in
        match rand (1 , 7) with
        | 1 -> buildSine next
        | 2 -> buildCosine next
        | 3 -> buildAverage (next , next)
        | 4 -> buildTimes (next , next)
        | 5 -> buildThresh (next , next , next , next)
        | 6 -> buildSqrt next
        | 7 -> buildGauss (next , next , next))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG),(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

*)

(* changed exprs
Case (Just (29,2)-(40,44)) (Var (Just (29,8)-(29,13)) "depth") [(LitPat (Just (30,4)-(30,5)) (LI 0),Nothing,Case (Just (30,9)-(30,57)) (App (Just (30,16)-(30,27)) (Var (Just (30,16)-(30,20)) "rand") [Tuple (Just (30,21)-(30,27)) [Lit (Just (30,22)-(30,23)) (LI 1),Lit (Just (30,25)-(30,26)) (LI 2)]]) [(LitPat (Just (30,35)-(30,36)) (LI 1),Nothing,ConApp (Just (30,40)-(30,44)) "VarX" Nothing Nothing),(LitPat (Just (30,47)-(30,48)) (LI 2),Nothing,ConApp (Just (30,52)-(30,56)) "VarY" Nothing Nothing)]),(WildPat (Just (31,4)-(31,5)),Nothing,Let (Just (32,6)-(40,44)) NonRec [(VarPat (Just (32,10)-(32,14)) "next",App (Just (32,17)-(32,42)) (Var (Just (32,17)-(32,22)) "build") [Tuple (Just (32,23)-(32,42)) [Var (Just (32,24)-(32,28)) "rand",Bop (Just (32,30)-(32,41)) Minus (Var (Just (32,31)-(32,36)) "depth") (Lit (Just (32,39)-(32,40)) (LI 1))]])] (Case (Just (33,6)-(40,44)) (App (Just (33,13)-(33,24)) (Var (Just (33,13)-(33,17)) "rand") [Tuple (Just (33,18)-(33,24)) [Lit (Just (33,19)-(33,20)) (LI 1),Lit (Just (33,22)-(33,23)) (LI 7)]]) [(LitPat (Just (34,9)-(34,10)) (LI 1),Nothing,App (Just (34,14)-(34,28)) (Var (Just (34,14)-(34,23)) "buildSine") [Var (Just (34,24)-(34,28)) "next"]),(LitPat (Just (35,9)-(35,10)) (LI 2),Nothing,App (Just (35,14)-(35,30)) (Var (Just (35,14)-(35,25)) "buildCosine") [Var (Just (35,26)-(35,30)) "next"]),(LitPat (Just (36,9)-(36,10)) (LI 3),Nothing,App (Just (36,14)-(36,39)) (Var (Just (36,14)-(36,26)) "buildAverage") [Tuple (Just (36,27)-(36,39)) [Var (Just (36,28)-(36,32)) "next",Var (Just (36,34)-(36,38)) "next"]]),(LitPat (Just (37,9)-(37,10)) (LI 4),Nothing,App (Just (37,14)-(37,37)) (Var (Just (37,14)-(37,24)) "buildTimes") [Tuple (Just (37,25)-(37,37)) [Var (Just (37,26)-(37,30)) "next",Var (Just (37,32)-(37,36)) "next"]]),(LitPat (Just (38,9)-(38,10)) (LI 5),Nothing,App (Just (38,14)-(38,50)) (Var (Just (38,14)-(38,25)) "buildThresh") [Tuple (Just (38,26)-(38,50)) [Var (Just (38,27)-(38,31)) "next",Var (Just (38,33)-(38,37)) "next",Var (Just (38,39)-(38,43)) "next",Var (Just (38,45)-(38,49)) "next"]]),(LitPat (Just (39,9)-(39,10)) (LI 6),Nothing,App (Just (39,14)-(39,28)) (Var (Just (39,14)-(39,23)) "buildSqrt") [Var (Just (39,24)-(39,28)) "next"]),(LitPat (Just (40,9)-(40,10)) (LI 7),Nothing,App (Just (40,14)-(40,43)) (Var (Just (40,14)-(40,24)) "buildGauss") [Tuple (Just (40,25)-(40,43)) [Var (Just (40,26)-(40,30)) "next",Var (Just (40,32)-(40,36)) "next",Var (Just (40,38)-(40,42)) "next"]])]))]
*)

(* typed spans
(29,2)-(40,44)
*)

(* correct types
expr
*)

(* bad types
unit -> expr
*)
