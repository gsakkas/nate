
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | _ ->
      buildTimes
        ((buildCosine (buildSine (buildX ()))),
          (buildCosine (buildSine (buildX ()))))
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 -> buildSine ()
  | 4 -> buildSine (buildX ())
  | 5 -> buildSine (buildX ())
  | 6 -> buildSine (buildX ())
  | 7 -> buildSine (buildX ());;


(* fix

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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | _ ->
      buildTimes
        ((buildCosine (buildSine (buildX ()))),
          (buildCosine (buildSine (buildX ()))))
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 -> buildSine (buildX ())
  | 4 -> buildSine (buildX ())
  | 5 -> buildSine (buildX ())
  | 6 -> buildSine (buildX ())
  | 7 -> buildSine (buildX ());;

*)

(* changed spans
(29,20)-(29,22)
buildX ()
AppG [ConAppG Nothing]

*)

(* type error slice
(13,4)-(13,27)
(13,15)-(13,25)
(13,19)-(13,25)
(13,24)-(13,25)
(29,10)-(29,19)
(29,10)-(29,22)
(29,20)-(29,22)
*)
