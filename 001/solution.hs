
summ t n = n * (quot ((p+1)*p) 2)
			where p = quot t n

main = do
		  let target = 999
		  print $ (summ target 3) + (summ target 5) - (summ target 15)
