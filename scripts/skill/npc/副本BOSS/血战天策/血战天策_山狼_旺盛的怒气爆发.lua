---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/血战天策_山狼_旺盛的怒气爆发.lua
-- 更新时间:	2013/11/6 14:28:57
-- 更新用户:	ks13376-PC
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	local caoxueyang = scene.GetNpcByNickName("caoxueyang")
	if caoxueyang then
		npc.CastSkill(8536, 1)
	end
	
	if not caoxueyang then
		npc.CastSkill(8536, 2)
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com