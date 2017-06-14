----------------------------------------------------------------------
--Name: 云湖天池玄冰寒气buff效果
--Date:		2009.4.27
--Author:	唐一鸣
--Version: Alpha1
--Comment:	
----------------------------------------------------------------------

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npc = scene.GetNpcByNickName("caster")
	if npc then
		npc.CastSkill(7170, 1, TARGET.PLAYER, player.dwID)
	end
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com