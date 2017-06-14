function Apply(dwCharacterID)
	local ctarget = nil
	if not IsPlayer(dwCharacterID) then
		ctarget = GetNpc(dwCharacterID)
	else
		ctarget = GetPlayer(dwCharacterID)
	end
	
	local buff = ctarget.GetBuff(3760, 1)
	if not buff then
		return
	end

	if buff.nLeftActiveCount - 1 < buff.nStackNum then
		ctarget.DelBuff(3760, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com