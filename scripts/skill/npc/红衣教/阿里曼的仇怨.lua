function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local nBuff = cPlayer.GetBuff(4017,1)
	if not nBuff then
		return
	end
	if nBuff.nStackNum == 30 then
		cPlayer.AddBuff(0,99,4018,1)
		for i = 1 , 30 do
			cPlayer.DelBuff(4017,1)
		end
	end
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com