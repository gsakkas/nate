CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
match rand (0 , 1) with
| 0 -> buildX ()
| _ -> buildY ()
match rand (0 , 7) with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
match rand (1 , 5) with
| 1 -> buildSine (build (rand , depth - 1))
| 2 -> buildCosine (build (rand , depth - 1))
| 3 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
match rand (1 , 2) with
| 1 -> buildX ()
| 2 -> buildY ()
