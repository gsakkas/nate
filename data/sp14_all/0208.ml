
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
  | _ -> buildX ();;

*)

(* changed spans
(21,6)-(22,57)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* changed exprs
App (Just (18,9)-(18,18)) (Var (Just (18,9)-(18,15)) "buildX") [ConApp (Just (18,16)-(18,18)) "()" Nothing (Just (TApp "unit" []))]
*)

(* typed spans
(18,9)-(18,18)
*)

(* correct types
expr
*)

(* bad types
unit
*)
