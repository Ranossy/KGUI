function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return  
	end
	local scene = cPlayer.GetScene()
	if not scene then 
		return
	end
	local cNpc = scene.GetNpcByNickName("riying")
	if not cNpc then
		return
	end
	cNpc.nCurrentMana = cNpc.nCurrentMana + cNpc.nMaxMana * 0.1
	if cPlayer.nCurrentMana < cPlayer.nMaxMana * 0.1 then
			cPlayer.DelBuff(3208,1)
	else
		cPlayer.nCurrentMana = cPlayer.nCurrentMana - cPlayer.nMaxMana * 0.1
		cNpc.nCurrentMana = cNpc.nCurrentMana + cNpc.nMaxMana * 0.1
	end
	cNpc.PlaySfx(2, cNpc.nX, cNpc.nY, cNpc.nZ)
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com