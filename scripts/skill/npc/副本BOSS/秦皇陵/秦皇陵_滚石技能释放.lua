---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/秦皇陵_滚石技能释放.lua
-- 更新时间:	2014/2/26 14:41:24
-- 更新用户:	ks13376-PC
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	if not scene then
		return
	end

	if scene.dwMapID == 182 then
		npc.CastSkill(8890, 1)
	end

	if scene.dwMapID == 183 then
		npc.CastSkill(8890, 2)
	end
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com