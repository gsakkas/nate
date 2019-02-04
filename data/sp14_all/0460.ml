
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec helperDigits (num,newList) =
  if num < 10
  then num :: newList
  else helperDigits ((num / 10), ((num mod 10) :: newList));;

let rec digitsOfInt n = if n < 0 then [] else helperDigits (n, []);;

*)

(* changed spans
(2,20)-(2,40)
fun (num , newList) ->
  if num < 10
  then num :: newList
  else helperDigits (num / 10 , (num mod 10) :: newList)
LamG (IteG EmptyG EmptyG EmptyG)

(2,24)-(2,40)
helperDigits (n , [])
AppG (fromList [TupleG (fromList [EmptyG])])

*)
