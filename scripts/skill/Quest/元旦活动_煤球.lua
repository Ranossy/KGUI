----------------------------------------------------------------------
--Name: 
--Date:		2009.4.27
--Author:	
--Version: Alpha1
--Comment:	
----------------------------------------------------------------------

function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local buff = npc.GetBuff(1613, 1)
	if buff and buff.nStackNum >= 5 then
		npc.FireAIEvent(2005, 0, 0)
	end
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com