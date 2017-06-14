function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then 
		return
	end
	npc.PlaySfx(345,npc.nX,npc.nY,npc.nZ)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com