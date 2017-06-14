function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	local tResult = Random(1, 4)
	local tID = 4172 + tResult
	npc.CastSkill(tID, 2)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com