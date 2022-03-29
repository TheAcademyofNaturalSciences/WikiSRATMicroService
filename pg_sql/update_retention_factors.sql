
select * from wikiwtershed.retetion_factors;

-- COEFFS AS OF 03/28/2022
update wikiwtershed.retetion_factors
set tn = 0.0,
	tp = 0.13,
	tss = 0.1
;

-- BASED ON 03/28/2022 call with Barry this is what they changed to
update wikiwtershed.retetion_factors
set tn = 0.02,
	tp = 0.16,
	tss = 0.2
;










