function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	npc.nCurrentLife = npc.nCurrentLife - npc.nMaxLife * 0.1
	if npc.nCurrentLife <= 5 then 
		npc.Die()
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com