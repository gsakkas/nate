
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ ->
      let y = rand (2, 6) in
      if y = 2 then buildSine (build (rand, (depth - 1)));;


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
  | _ -> let y = rand (2, 6) in build (rand, (y - 1));;

*)

(* changed spans
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(21,6)-(22,57)
(22,6)-(22,57)
(22,9)-(22,10)
(22,9)-(22,14)
(22,13)-(22,14)
(22,30)-(22,57)
*)

(* type error slice
(11,3)-(11,26)
(11,14)-(11,24)
(11,18)-(11,24)
(22,6)-(22,57)
(22,6)-(22,57)
(22,6)-(22,57)
(22,20)-(22,29)
(22,20)-(22,57)
*)

(* all spans
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(13,11)-(13,20)
(13,16)-(13,20)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(22,57)
(18,2)-(22,57)
(18,8)-(18,13)
(19,9)-(19,59)
(19,12)-(19,29)
(19,12)-(19,25)
(19,13)-(19,17)
(19,18)-(19,24)
(19,19)-(19,20)
(19,22)-(19,23)
(19,28)-(19,29)
(19,35)-(19,44)
(19,35)-(19,41)
(19,42)-(19,44)
(19,50)-(19,59)
(19,50)-(19,56)
(19,57)-(19,59)
(21,6)-(22,57)
(21,14)-(21,25)
(21,14)-(21,18)
(21,19)-(21,25)
(21,20)-(21,21)
(21,23)-(21,24)
(22,6)-(22,57)
(22,9)-(22,14)
(22,9)-(22,10)
(22,13)-(22,14)
(22,20)-(22,57)
(22,20)-(22,29)
(22,30)-(22,57)
(22,31)-(22,36)
(22,37)-(22,56)
(22,38)-(22,42)
(22,44)-(22,55)
(22,45)-(22,50)
(22,53)-(22,54)
(22,6)-(22,57)
*)
