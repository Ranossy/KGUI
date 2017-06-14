function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then 
		npc.DoAction(0, 10060)
		if npc.GetBuff(2214,1) then
			npc.CastSkill(2134,1)
		elseif npc.GetBuff(2214,2) then
			npc.CastSkill(2134,2)
		elseif npc.GetBuff(2214,3) then
			npc.CastSkill(2134,3)
		elseif npc.GetBuff(2214,4) then
			npc.CastSkill(2134,4)
		end
	end
	
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com