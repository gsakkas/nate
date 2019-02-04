
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (((mulByDigit i (List.rev t)) * 10) h) * i;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(5,12)-(5,50)
EMPTY
EmptyG

(5,12)-(5,54)
EMPTY
EmptyG

(5,13)-(5,47)
EMPTY
EmptyG

(5,15)-(5,25)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(5,38)-(5,39)
List.map (fun x -> x * 10) t
AppG (fromList [VarG,LamG EmptyG])

(5,44)-(5,46)
fun x -> x * 10
LamG (BopG EmptyG EmptyG)

(5,48)-(5,49)
[h * i]
ListG (BopG EmptyG EmptyG) Nothing

*)
