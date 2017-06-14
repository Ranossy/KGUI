function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	   cPlayer.nCurrentLife  = cPlayer.nCurrentLife - cPlayer.nMaxLife * 0.1
	   cPlayer.nCurrentMana  = cPlayer.nCurrentMana - cPlayer.nMaxMana * 0.05
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com